@interface PUAudioMixModeCollectionViewCell
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (_TtC15PhotosUIPrivateP33_8BF9023972CBF50D2A1FAA417D58CBA832PUAudioMixModeCollectionViewCell)initWithCoder:(id)a3;
- (_TtC15PhotosUIPrivateP33_8BF9023972CBF50D2A1FAA417D58CBA832PUAudioMixModeCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation PUAudioMixModeCollectionViewCell

- (_TtC15PhotosUIPrivateP33_8BF9023972CBF50D2A1FAA417D58CBA832PUAudioMixModeCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC15PhotosUIPrivateP33_8BF9023972CBF50D2A1FAA417D58CBA832PUAudioMixModeCollectionViewCell *)sub_1AEAEF140(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)isSelected
{
  v2 = self;
  unsigned __int8 v3 = sub_1AEAEF384((SEL *)&selRef_isSelected);

  return v3 & 1;
}

- (void)setSelected:(BOOL)a3
{
  v4 = self;
  sub_1AEAEF420(a3, (SEL *)&selRef_setSelected_);
}

- (BOOL)isHighlighted
{
  v2 = self;
  unsigned __int8 v3 = sub_1AEAEF384((SEL *)&selRef_isHighlighted);

  return v3 & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_1AEAEF420(a3, (SEL *)&selRef_setHighlighted_);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AEAEF5E0();
}

- (_TtC15PhotosUIPrivateP33_8BF9023972CBF50D2A1FAA417D58CBA832PUAudioMixModeCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AEAEFAD4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivateP33_8BF9023972CBF50D2A1FAA417D58CBA832PUAudioMixModeCollectionViewCell_label));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC15PhotosUIPrivateP33_8BF9023972CBF50D2A1FAA417D58CBA832PUAudioMixModeCollectionViewCell_labelBackground);
}

@end