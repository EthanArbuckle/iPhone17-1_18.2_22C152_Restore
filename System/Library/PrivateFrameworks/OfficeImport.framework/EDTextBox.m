@interface EDTextBox
+ (id)textBox;
- (id)alignmentInfo;
- (id)description;
- (id)protection;
- (id)text;
- (void)setAlignmentInfo:(id)a3;
- (void)setProtection:(id)a3;
- (void)setText:(id)a3;
@end

@implementation EDTextBox

+ (id)textBox
{
  v2 = objc_alloc_init(EDTextBox);
  return v2;
}

- (void)setAlignmentInfo:(id)a3
{
  v5 = (EDAlignmentInfo *)a3;
  mAlignmentInfo = self->mAlignmentInfo;
  p_mAlignmentInfo = &self->mAlignmentInfo;
  if (mAlignmentInfo != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mAlignmentInfo, a3);
    v5 = v8;
  }
}

- (void)setProtection:(id)a3
{
  v5 = (EDProtection *)a3;
  mProtection = self->mProtection;
  p_mProtection = &self->mProtection;
  if (mProtection != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mProtection, a3);
    v5 = v8;
  }
}

- (void)setText:(id)a3
{
  v5 = (EDString *)a3;
  mText = self->mText;
  p_mText = &self->mText;
  if (mText != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mText, a3);
    v5 = v8;
  }
}

- (id)text
{
  return self->mText;
}

- (id)alignmentInfo
{
  return self->mAlignmentInfo;
}

- (id)protection
{
  return self->mProtection;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDTextBox;
  v2 = [(EDTextBox *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mProtection, 0);
  objc_storeStrong((id *)&self->mAlignmentInfo, 0);
  objc_storeStrong((id *)&self->mText, 0);
}

@end