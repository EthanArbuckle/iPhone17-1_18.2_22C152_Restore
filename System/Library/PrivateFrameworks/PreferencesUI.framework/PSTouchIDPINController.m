@interface PSTouchIDPINController
- (id)pinInstructionsPrompt;
@end

@implementation PSTouchIDPINController

- (id)pinInstructionsPrompt
{
  if ([(DevicePINController *)self mode]
    || *(_DWORD *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FD38]) != 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)PSTouchIDPINController;
    v3 = [(DevicePINController *)&v5 pinInstructionsPrompt];
  }
  else
  {
    v3 = PSLocalizableMesaStringForKey();
  }
  return v3;
}

@end