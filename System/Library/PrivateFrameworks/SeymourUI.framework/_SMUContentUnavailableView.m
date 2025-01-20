@interface _SMUContentUnavailableView
- (id)configurationForType:(int64_t)a3;
- (void)smu_updateWithType:(int64_t)a3 text:(id)a4 secondaryText:(id)a5 image:(id)a6 buttonTitle:(id)a7 buttonPrimaryAction:(id)a8;
@end

@implementation _SMUContentUnavailableView

- (void)smu_updateWithType:(int64_t)a3 text:(id)a4 secondaryText:(id)a5 image:(id)a6 buttonTitle:(id)a7 buttonPrimaryAction:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v22 = [(_SMUContentUnavailableView *)self configurationForType:a3];
  [v22 setText:v18];

  [v22 setSecondaryText:v17];
  [v22 setImage:v16];

  v19 = [v22 buttonProperties];
  v20 = [v19 configuration];
  [v20 setTitle:v15];

  v21 = [v22 buttonProperties];
  [v21 setPrimaryAction:v14];

  [(UIContentUnavailableView *)self setConfiguration:v22];
}

- (id)configurationForType:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      self = [MEMORY[0x263F82600] loadingConfiguration];
      break;
    case 1:
      self = [MEMORY[0x263F82600] emptyProminentConfiguration];
      break;
    case 0:
      self = [MEMORY[0x263F82600] emptyConfiguration];
      break;
  }

  return self;
}

@end