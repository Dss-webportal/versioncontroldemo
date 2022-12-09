SELECT

 T0."DocNum"

,T1."LineNum"

,T1."ItemCode"

,T1."Quantity" as 'SO Qty'

,T1."OpenQty" as 'SO Open Qty'

,T1."ItemCode"

-- ,T2."Quantity" as 'DO Qty'

,T2."OpenQty" as 'DO Oepn Qty'

,(T3."Quantity"+T4."Quantity") as 'AR Inv Qty'

 

FROM ORDR T0
-- doc entry name changed
INNER JOIN RDR1 T1 ON T0."DocEntry" = T1."DocEntry"

left join DLN1 T2 on T2."BaseEntry"=T1."DocEntry" and T2."ItemCode"=T1."ItemCode"

left join inv1 T3 on T3."BaseEntry"=T2."DocEntry" and T3."ItemCode"=T2."ItemCode"

left join inv1 T4 on T4."BaseEntry"=T1."DocEntry" and T4."ItemCode"=T1."ItemCode"

WHERE T1."OpenQty" >0