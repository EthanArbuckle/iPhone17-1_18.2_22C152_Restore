@interface THWAnchoredWidgetRep
- (id)_controlHostRep;
- (id)delegateConformingToProtocol:(id)a3 forRep:(id)a4;
@end

@implementation THWAnchoredWidgetRep

- (id)_controlHostRep
{
  [self interactiveCanvasController].repForLayout:[self layout].widgetLayout];

  return (id)TSUProtocolCast();
}

- (id)delegateConformingToProtocol:(id)a3 forRep:(id)a4
{
  if (!protocol_isEqual((Protocol *)a3, (Protocol *)&OBJC_PROTOCOL___THWControlHosting)) {
    return 0;
  }

  return [(THWAnchoredWidgetRep *)self _controlHostRep];
}

@end