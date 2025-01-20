@interface MenuProvidedButton
- (CGSize)intrinsicContentSize;
- (_TtC14WorkflowEditor18MenuProvidedButton)initWithCoder:(id)a3;
- (_TtC14WorkflowEditor18MenuProvidedButton)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MenuProvidedButton

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_234A4B2C0();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC14WorkflowEditor18MenuProvidedButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_234A4CFDC();
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  double v6 = self;
  id v7 = sub_234A4D070();

  return v7;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_234A4D390(a3);
}

- (_TtC14WorkflowEditor18MenuProvidedButton)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
}

@end