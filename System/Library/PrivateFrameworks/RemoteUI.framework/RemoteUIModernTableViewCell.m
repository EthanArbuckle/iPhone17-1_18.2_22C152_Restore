@interface RemoteUIModernTableViewCell
- (BOOL)forceFullSizeDetailLabel;
- (BOOL)shouldSkipCustomLayout;
- (CGSize)imageSize;
- (RUIWebContainerView)webContainerView;
- (RemoteUIModernTableViewCell)initWithCoder:(id)a3;
- (RemoteUIModernTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)imageView;
- (UILabel)detailTextLabel;
- (UILabel)textLabel;
- (void)setBadgeImage:(id)a3 tintColor:(id)a4 isCircular:(BOOL)a5;
- (void)setDetailLinkText:(id)a3 handler:(id)a4;
- (void)setForceFullSizeDetailLabel:(BOOL)a3;
- (void)setHTMLData:(id)a3 sourceURL:(id)a4 delegate:(id)a5;
- (void)setImage:(id)a3 padding:(UIEdgeInsets)a4 tintColor:(id)a5;
- (void)setImageSize:(CGSize)a3;
- (void)setWebContainerView:(id)a3;
- (void)tintColorDidChange;
@end

@implementation RemoteUIModernTableViewCell

- (UILabel)textLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR___RemoteUIModernTableViewCell__textLabel));
}

- (UIImageView)imageView
{
  return (UIImageView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                + OBJC_IVAR___RemoteUIModernTableViewCell__imageView));
}

- (UILabel)detailTextLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR___RemoteUIModernTableViewCell__detailLabel));
}

- (CGSize)imageSize
{
  v4.receiver = self;
  v4.super_class = (Class)RemoteUIModernTableViewCell;
  [(RemoteUITableViewCell *)&v4 imageSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v7.receiver = self;
  v7.super_class = (Class)RemoteUIModernTableViewCell;
  v5 = self;
  -[RemoteUITableViewCell setImageSize:](&v7, sel_setImageSize_, width, height);
  v6[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F128);
  v6[4] = sub_21455B000(&qword_26780F130, &qword_26780F128);
  __swift_allocate_boxed_opaque_existential_0(v6);
  sub_2145F2F40();
  sub_214602988();
  MEMORY[0x2166A3880](v6);
}

- (RemoteUIModernTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  _sSo27RemoteUIModernTableViewCellC0A2UIE5coderABSgSo7NSCoderC_tcfc_0();
}

- (RUIWebContainerView)webContainerView
{
  return (RUIWebContainerView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                        + OBJC_IVAR___RemoteUIModernTableViewCell__webContainerView));
}

- (void)setWebContainerView:(id)a3
{
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___RemoteUIModernTableViewCell__webContainerView);
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___RemoteUIModernTableViewCell__webContainerView) = (Class)a3;
  id v5 = a3;
  v6 = self;

  v7[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F128);
  v7[4] = sub_21455B000(&qword_26780F130, &qword_26780F128);
  __swift_allocate_boxed_opaque_existential_0(v7);
  sub_2145F2F40();
  sub_214602988();
  MEMORY[0x2166A3880](v7);
}

- (RemoteUIModernTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_214602EA8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (RemoteUIModernTableViewCell *)RemoteUIModernTableViewCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (void)setDetailLinkText:(id)a3 handler:(id)a4
{
  uint64_t v6 = (void (*)(uint64_t, uint64_t, uint64_t))_Block_copy(a4);
  objc_super v7 = v6;
  if (a3)
  {
    uint64_t v8 = sub_214602EA8();
    a3 = v9;
    if (v7)
    {
LABEL_3:
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + 16) = v7;
      objc_super v7 = sub_2145F4138;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if (v6) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = 0;
LABEL_6:
  v11 = self;
  RemoteUIModernTableViewCell.setDetailLinkText(_:handler:)(v8, (uint64_t)a3, (uint64_t)v7, v10);
  sub_21458CF28((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (BOOL)forceFullSizeDetailLabel
{
  v3.receiver = self;
  v3.super_class = (Class)RemoteUIModernTableViewCell;
  return [(RemoteUITableViewCell *)&v3 forceFullSizeDetailLabel];
}

- (void)setForceFullSizeDetailLabel:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)RemoteUIModernTableViewCell;
  objc_super v4 = self;
  [(RemoteUITableViewCell *)&v6 setForceFullSizeDetailLabel:v3];
  v5[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F128);
  v5[4] = sub_21455B000(&qword_26780F130, &qword_26780F128);
  __swift_allocate_boxed_opaque_existential_0(v5);
  sub_2145F2F40();
  sub_214602988();
  MEMORY[0x2166A3880](v5);
}

- (void)tintColorDidChange
{
  double v2 = self;
  RemoteUIModernTableViewCell.tintColorDidChange()();
}

- (void)setHTMLData:(id)a3 sourceURL:(id)a4 delegate:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780DEF0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    id v18 = a4;
    swift_unknownObjectRetain();
    v19 = self;
    unint64_t v16 = 0xF000000000000000;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v20 = sub_2146020B8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v11, 1, 1, v20);
    goto LABEL_6;
  }
  id v12 = a4;
  swift_unknownObjectRetain();
  v13 = self;
  id v14 = a3;
  a3 = (id)sub_2146020E8();
  unint64_t v16 = v15;

  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  sub_214602058();

  uint64_t v17 = sub_2146020B8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 0, 1, v17);
LABEL_6:
  RemoteUIModernTableViewCell.setHTMLData(_:sourceURL:delegate:)((uint64_t)a3, v16, (uint64_t)v11, (uint64_t)a5);
  sub_214556AE0((uint64_t)a3, v16);
  swift_unknownObjectRelease();

  sub_2145515B8((uint64_t)v11, &qword_26780DEF0);
}

- (void)setImage:(id)a3 padding:(UIEdgeInsets)a4 tintColor:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = self;
  uint64_t v10 = [(RemoteUIModernTableViewCell *)v9 imageView];
  [(UIImageView *)v10 setImage:v7];

  v11 = [(RemoteUIModernTableViewCell *)v9 imageView];
  [(UIImageView *)v11 setTintColor:v8];
}

- (void)setBadgeImage:(id)a3 tintColor:(id)a4 isCircular:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  v16.is_nil = (char)v11;
  v13 = v11;
  v15.value.super.isa = (Class)a3;
  v15.is_nil = (char)a4;
  v16.value.super.isa = (Class)v5;
  RemoteUIModernTableViewCell.setBadgeImage(_:tintColor:isCircular:)(v15, v16, v12);
}

- (BOOL)shouldSkipCustomLayout
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___RemoteUIModernTableViewCell__textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___RemoteUIModernTableViewCell__detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___RemoteUIModernTableViewCell__imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___RemoteUIModernTableViewCell__webContainerView));
  swift_bridgeObjectRelease();
  sub_21458CF28(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR___RemoteUIModernTableViewCell_detailLinkHandler));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___RemoteUIModernTableViewCell_badgeInfo);
  objc_super v4 = *(void **)((char *)&self->super.super.super.super._responderFlags
                + OBJC_IVAR___RemoteUIModernTableViewCell_badgeInfo);
  sub_2145F3340(v3, v4);
}

@end