using { SAPB1 as external } from '../srv/external/SapBusinessOne';

@path : '/service/Purchase_order'
service Purchase_order
{
    @cds.redirection.target
    entity PurchaseOrders as
        projection on external.PurchaseOrders
        {
            *
        }
        excluding
        {
            FederalTaxID,
            UpdateDate,
            CreateDate,
            DataVersion
        };
}

annotate Purchase_order with @requires :
[
    'authenticated-user'
];
