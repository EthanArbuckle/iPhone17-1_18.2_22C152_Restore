@interface PSKeyboardNavigationSearchBar
- (id)keyCommands;
- (void)_downArrowKeyPressed;
- (void)_escapeKeyPressed;
- (void)_upArrowKeyPressed;
@end

@implementation PSKeyboardNavigationSearchBar

- (id)keyCommands
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:*MEMORY[0x1E4F439F0] modifierFlags:0 action:sel__escapeKeyPressed];
  [v2 setWantsPriorityOverSystemBehavior:1];
  v3 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:*MEMORY[0x1E4F439D8] modifierFlags:0 action:sel__downArrowKeyPressed];
  [v3 setWantsPriorityOverSystemBehavior:1];
  v4 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:*MEMORY[0x1E4F43A80] modifierFlags:0 action:sel__upArrowKeyPressed];
  [v4 setWantsPriorityOverSystemBehavior:1];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

- (void)_escapeKeyPressed
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"PSSearchBarEscapeKeyPressedNotification" object:self];
}

- (void)_downArrowKeyPressed
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"PSSearchBarDownArrowKeyPressedNotification" object:self];
}

- (void)_upArrowKeyPressed
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"PSSearchBarUpArrowKeyPressedNotification" object:self];
}

@end