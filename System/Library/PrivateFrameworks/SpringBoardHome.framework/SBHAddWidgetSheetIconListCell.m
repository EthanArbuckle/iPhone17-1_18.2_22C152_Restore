@interface SBHAddWidgetSheetIconListCell
- (BOOL)_descendantsShouldHighlight;
- (BOOL)separatorVisible;
- (BOOL)wantsHeaderView;
- (MTVisualStylingProvider)visualStylingProvider;
- (NSString)title;
- (SBHAddWidgetSheetIconListCell)initWithCoder:(id)a3;
- (SBHAddWidgetSheetIconListCell)initWithFrame:(CGRect)a3;
- (SBIconImageInfo)iconImageInfo;
- (SBIconListView)iconListView;
- (UIColor)iconBackgroundColor;
- (UIImage)iconImage;
- (UILabel)textLabel;
- (void)iconListView:(id)a3 didAddIconView:(id)a4;
- (void)iconListView:(id)a3 didRemoveIconView:(id)a4;
- (void)prepareForReuse;
- (void)setIconBackgroundColor:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setIconImageInfo:(SBIconImageInfo *)a3;
- (void)setIconListView:(id)a3;
- (void)setSeparatorVisible:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setVisualStylingProvider:(id)a3;
- (void)setWantsHeaderView:(BOOL)a3;
@end

@implementation SBHAddWidgetSheetIconListCell

- (SBHAddWidgetSheetIconListCell)initWithFrame:(CGRect)a3
{
  return (SBHAddWidgetSheetIconListCell *)sub_1D81A483C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBHAddWidgetSheetIconListCell)initWithCoder:(id)a3
{
  id v3 = a3;
  _sSo29SBHAddWidgetSheetIconListCellC15SpringBoardHomeE5coderABSgSo7NSCoderC_tcfc_0();
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  v7 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo);
  double v8 = *(double *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo);
  double v9 = *(double *)((char *)&self->super.super.super.super._responderFlags
                 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo);
  double v10 = *(double *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                  + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo);
  double v11 = *(double *)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints
                  + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo);
  void *v7 = v3;
  v7[1] = v4;
  v7[2] = v5;
  v7[3] = v6;
  v12 = self;
  sub_1D81A59FC(v8, v9, v10, v11);
}

- (NSString)title
{
  v2 = self;
  uint64_t v3 = [(SBHAddWidgetSheetIconListCell *)v2 textLabel];
  uint64_t v4 = [(UILabel *)v3 text];

  if (v4)
  {
    sub_1D81B1F68();

    uint64_t v5 = (void *)sub_1D81B1F58();
    swift_bridgeObjectRelease();
  }
  else
  {

    uint64_t v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setTitle:(id)a3
{
  if (a3)
  {
    sub_1D81B1F68();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = self;
  v7 = [(SBHAddWidgetSheetIconListCell *)v6 textLabel];
  if (v5)
  {
    id v8 = (id)sub_1D81B1F58();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = 0;
  }
  [(UILabel *)v7 setText:v8];
}

- (UIImage)iconImage
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageView);
  uint64_t v3 = self;
  id v4 = objc_msgSend(v2, sel_image);
  if (!v4) {
    id v4 = objc_msgSend(*(id *)((char *)&v3->super.super.super.super.super.isa+ OBJC_IVAR___SBHAddWidgetSheetIconListCell_symbolImageView), sel_image);
  }

  return (UIImage *)v4;
}

- (void)setIconImage:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1D81A5D2C(a3);
}

- (UIColor)iconBackgroundColor
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageView), sel_backgroundColor);
  return (UIColor *)v2;
}

- (void)setIconBackgroundColor:(id)a3
{
}

- (SBIconListView)iconListView
{
  return (SBIconListView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                   + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconListView));
}

- (void)setIconListView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconListView);
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconListView) = (Class)a3;
  id v6 = a3;
  id v5 = self;
  sub_1D81A5EF8(v4);
}

- (BOOL)separatorVisible
{
  return *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR___SBHAddWidgetSheetIconListCell_separatorVisible);
}

- (void)setSeparatorVisible:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR___SBHAddWidgetSheetIconListCell_separatorVisible) = a3;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___SBHAddWidgetSheetIconListCell_separatorView), sel_setHidden_, !a3);
}

- (BOOL)wantsHeaderView
{
  return *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR___SBHAddWidgetSheetIconListCell_wantsHeaderView);
}

- (void)setWantsHeaderView:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR___SBHAddWidgetSheetIconListCell_wantsHeaderView) = a3;
  uint64_t v3 = self;
  sub_1D81A674C();
}

- (MTVisualStylingProvider)visualStylingProvider
{
  id v2 = (void *)MEMORY[0x1D9484CA0]((char *)self + OBJC_IVAR___SBHAddWidgetSheetIconListCell_visualStylingProvider, a2);
  return (MTVisualStylingProvider *)v2;
}

- (void)setVisualStylingProvider:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1D81A688C(a3);
}

- (void)prepareForReuse
{
  id v2 = self;
  SBHAddWidgetSheetIconListCell.prepareForReuse()();
}

- (BOOL)_descendantsShouldHighlight
{
  return 0;
}

- (UILabel)textLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR___SBHAddWidgetSheetIconListCell_textLabel));
}

- (void)iconListView:(id)a3 didAddIconView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1D81A638C(v7, v6);
}

- (void)iconListView:(id)a3 didRemoveIconView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1D81A7A60((uint64_t)v7);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconListView));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_symbolImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_listContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_titleStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_headerLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_headerTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_titleStackViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_listContainerViewTopConstraint));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___SBHAddWidgetSheetIconListCell_labelViewsForIconViews);
}

@end