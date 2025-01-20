@interface PUSidebarHeaderCell
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation PUSidebarHeaderCell

- (void)updateConfigurationUsingState:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PUSidebarHeaderCell;
  [(PUSidebarHeaderCell *)&v11 updateConfigurationUsingState:a3];
  v4 = [MEMORY[0x1E4FB1948] cellConfiguration];
  v5 = [(PUSidebarHeaderCell *)self configurationState];
  v6 = [v4 updatedConfigurationForState:v5];

  v7 = [v6 textProperties];
  v8 = [v7 color];

  v9 = [(PUSidebarHeaderCell *)self contentConfiguration];
  v10 = [v9 textProperties];
  [v10 setColor:v8];

  [(PUSidebarHeaderCell *)self setContentConfiguration:v9];
}

@end