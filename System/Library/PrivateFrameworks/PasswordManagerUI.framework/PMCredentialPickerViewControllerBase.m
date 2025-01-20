@interface PMCredentialPickerViewControllerBase
- (id)initRequiringTableView:(BOOL)a3;
@end

@implementation PMCredentialPickerViewControllerBase

- (id)initRequiringTableView:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PMCredentialPickerViewControllerBase();
  return [(ASCredentialRequestPaneViewController *)&v5 initRequiringTableView:v3];
}

@end