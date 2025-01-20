@interface EDOfficeArtClient
- (BOOL)areBoundsSet;
- (BOOL)hasBounds;
- (BOOL)hasText;
- (CGRect)bounds;
- (NSString)description;
- (id)anchor;
- (id)clientState;
- (id)comment;
- (id)sheet;
- (id)tableModels;
- (id)textBox;
- (void)setAnchor:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setClientState:(id)a3;
- (void)setComment:(id)a3;
- (void)setSheet:(id)a3;
- (void)setTableModels:(id)a3;
- (void)setTextBox:(id)a3;
@end

@implementation EDOfficeArtClient

- (void)setAnchor:(id)a3
{
  self->mIsBoundsSet = 0;
}

- (BOOL)hasBounds
{
  return self->mIsBoundsSet;
}

- (id)anchor
{
  return self->mAnchor;
}

- (id)comment
{
  return self->mComment;
}

- (BOOL)hasText
{
  mTextBox = self->mTextBox;
  if (!mTextBox) {
    return 0;
  }
  v3 = [(EDTextBox *)mTextBox text];
  v4 = [v3 string];
  BOOL v5 = [v4 length] != 0;

  return v5;
}

- (void)setTextBox:(id)a3
{
}

- (id)textBox
{
  return self->mTextBox;
}

- (void)setBounds:(CGRect)a3
{
  self->mIsBoundsSet = 1;
  self->mBounds = a3;
}

- (void)setSheet:(id)a3
{
}

- (CGRect)bounds
{
  double x = self->mBounds.origin.x;
  double y = self->mBounds.origin.y;
  double width = self->mBounds.size.width;
  double height = self->mBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setComment:(id)a3
{
}

- (id)clientState
{
  return self->mClientState;
}

- (void)setClientState:(id)a3
{
  id v5 = a3;
  id mClientState = self->mClientState;
  p_id mClientState = &self->mClientState;
  if (mClientState != v5)
  {
    id v8 = v5;
    objc_storeStrong(p_mClientState, a3);
    id v5 = v8;
  }
}

- (BOOL)areBoundsSet
{
  return self->mIsBoundsSet;
}

- (id)sheet
{
  return self->mSheet;
}

- (id)tableModels
{
  return self->mTableModels;
}

- (void)setTableModels:(id)a3
{
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDOfficeArtClient;
  v2 = [(EDOfficeArtClient *)&v4 description];
  return (NSString *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTableModels, 0);
  objc_storeStrong((id *)&self->mComment, 0);
  objc_storeStrong((id *)&self->mTextBox, 0);
  objc_storeStrong((id *)&self->mAnchor, 0);
  objc_storeStrong(&self->mClientState, 0);
  objc_storeStrong((id *)&self->mSheet, 0);
}

@end