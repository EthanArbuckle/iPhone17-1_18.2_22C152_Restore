@interface EDHyperlink
+ (id)hyperlink;
- (id)description;
- (id)descriptionText;
- (id)dosPath;
- (id)path;
- (id)reference;
- (id)textMark;
- (id)toolTip;
- (int)type;
- (void)setDescriptionText:(id)a3;
- (void)setDosPath:(id)a3;
- (void)setPath:(id)a3;
- (void)setReference:(id)a3;
- (void)setTextMark:(id)a3;
- (void)setToolTip:(id)a3;
- (void)setType:(int)a3;
@end

@implementation EDHyperlink

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (void)setDescriptionText:(id)a3
{
  v5 = (EDString *)a3;
  mDescriptionText = self->mDescriptionText;
  p_mDescriptionText = &self->mDescriptionText;
  if (mDescriptionText != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mDescriptionText, a3);
    v5 = v8;
  }
}

- (void)setPath:(id)a3
{
  v5 = (EDString *)a3;
  mPath = self->mPath;
  p_mPath = &self->mPath;
  if (mPath != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mPath, a3);
    v5 = v8;
  }
}

- (void)setDosPath:(id)a3
{
  v5 = (EDString *)a3;
  mDosPath = self->mDosPath;
  p_mDosPath = &self->mDosPath;
  if (mDosPath != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mDosPath, a3);
    v5 = v8;
  }
}

- (void)setTextMark:(id)a3
{
  v5 = (EDString *)a3;
  mTextMark = self->mTextMark;
  p_mTextMark = &self->mTextMark;
  if (mTextMark != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mTextMark, a3);
    v5 = v8;
  }
}

- (void)setReference:(id)a3
{
  v5 = (EDReference *)a3;
  mReference = self->mReference;
  p_mReference = &self->mReference;
  if (mReference != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mReference, a3);
    v5 = v8;
  }
}

- (void)setToolTip:(id)a3
{
  v5 = (EDString *)a3;
  mToolTip = self->mToolTip;
  p_mToolTip = &self->mToolTip;
  if (mToolTip != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mToolTip, a3);
    v5 = v8;
  }
}

+ (id)hyperlink
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (id)path
{
  return self->mPath;
}

- (id)dosPath
{
  return self->mDosPath;
}

- (id)descriptionText
{
  return self->mDescriptionText;
}

- (id)textMark
{
  return self->mTextMark;
}

- (id)toolTip
{
  return self->mToolTip;
}

- (id)reference
{
  return self->mReference;
}

- (int)type
{
  return self->mType;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDHyperlink;
  id v2 = [(EDHyperlink *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mReference, 0);
  objc_storeStrong((id *)&self->mToolTip, 0);
  objc_storeStrong((id *)&self->mTextMark, 0);
  objc_storeStrong((id *)&self->mDescriptionText, 0);
  objc_storeStrong((id *)&self->mDosPath, 0);
  objc_storeStrong((id *)&self->mPath, 0);
}

@end