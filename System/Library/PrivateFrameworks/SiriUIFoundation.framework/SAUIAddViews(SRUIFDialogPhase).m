@interface SAUIAddViews(SRUIFDialogPhase)
- (id)sruif_dialogPhase;
@end

@implementation SAUIAddViews(SRUIFDialogPhase)

- (id)sruif_dialogPhase
{
  v1 = [a1 propertyForKeyWithoutDeserializing:*MEMORY[0x263F65D18]];
  v2 = +[SRUIFDialogPhase dialogPhaseForAceDialogPhase:v1];

  return v2;
}

@end