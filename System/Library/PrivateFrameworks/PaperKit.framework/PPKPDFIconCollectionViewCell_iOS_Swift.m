@interface PPKPDFIconCollectionViewCell_iOS_Swift
- (PPKPDFIconCollectionViewCell_iOS_Swift)initWithCoder:(id)a3;
- (PPKPDFIconCollectionViewCell_iOS_Swift)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation PPKPDFIconCollectionViewCell_iOS_Swift

- (void)prepareForReuse
{
  v2 = self;
  PPKPDFIconCollectionViewCell_iOS_Swift.prepareForReuse()();
}

- (PPKPDFIconCollectionViewCell_iOS_Swift)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___PPKPDFIconCollectionViewCell_iOS_Swift_imageFetch) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PPKPDFIconCollectionViewCell_iOS_Swift();
  return -[PPKPDFIconCollectionViewCell_iOS initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (PPKPDFIconCollectionViewCell_iOS_Swift)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___PPKPDFIconCollectionViewCell_iOS_Swift_imageFetch) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PPKPDFIconCollectionViewCell_iOS_Swift();
  return [(PPKPDFIconCollectionViewCell_iOS *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end