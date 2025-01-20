@interface PXPeopleDetailSettingsSectionTitle
- (NSString)title;
- (PXPeopleDetailSettingsSectionTitle)initWithFrame:(CGRect)a3;
- (void)setTitle:(id)a3;
@end

@implementation PXPeopleDetailSettingsSectionTitle

- (void).cxx_destruct
{
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return [(UILabel *)self->_textLabel text];
}

- (PXPeopleDetailSettingsSectionTitle)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXPeopleDetailSettingsSectionTitle;
  v3 = -[PXPeopleDetailSettingsSectionTitle initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 10.0, 0.0, 300.0, 30.0);
    textLabel = v3->_textLabel;
    v3->_textLabel = (UILabel *)v4;

    v6 = [(PXPeopleDetailSettingsSectionTitle *)v3 contentView];
    [v6 addSubview:v3->_textLabel];
  }
  return v3;
}

@end