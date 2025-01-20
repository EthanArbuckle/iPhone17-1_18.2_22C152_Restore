@interface PFEIDrawablePlacement
- (id)wrapPropertyValueWithState:(id)a3;
- (void)mapNonChildPlacementModeWithState:(id)a3;
@end

@implementation PFEIDrawablePlacement

- (void)mapNonChildPlacementModeWithState:(id)a3
{
  if ([a3 ancestorEntryWithReaderClass:objc_opt_class()]
    || ([(PFXDrawablePlacement *)self setMode:3],
        xmlStrEqual((const xmlChar *)objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "xmlElementName"), (const xmlChar *)"table")))
  {
    [(PFXDrawablePlacement *)self setMode:2];
  }
}

- (id)wrapPropertyValueWithState:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PFEIDrawablePlacement;
  return [(PFXDrawablePlacement *)&v4 wrapPropertyValueWithState:a3];
}

@end