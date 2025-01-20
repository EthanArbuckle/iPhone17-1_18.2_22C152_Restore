@interface PXTitleSubtitleLabelSpec
- (BOOL)isEqual:(id)a3;
- (PXLabelSpec)subtitleLabelSpec;
- (PXLabelSpec)titleLabelSpec;
- (UIEdgeInsets)padding;
- (double)distanceBetweenTitleBaselineAndSubtitleBaseline;
- (double)interLabelSpacing;
- (double)maximumTitleSubtitleHeight;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setDistanceBetweenTitleBaselineAndSubtitleBaseline:(double)a3;
- (void)setInterLabelSpacing:(double)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setSubtitleLabelSpec:(id)a3;
- (void)setTitleLabelSpec:(id)a3;
@end

@implementation PXTitleSubtitleLabelSpec

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PXTitleSubtitleLabelSpec;
  v5 = -[PXViewSpec copyWithZone:](&v12, sel_copyWithZone_);
  id v6 = [(PXLabelSpec *)self->_titleLabelSpec copyWithZone:a3];
  v7 = (void *)v5[12];
  v5[12] = v6;

  id v8 = [(PXLabelSpec *)self->_subtitleLabelSpec copyWithZone:a3];
  v9 = (void *)v5[13];
  v5[13] = v8;

  v5[14] = *(void *)&self->_interLabelSpacing;
  v5[15] = *(void *)&self->_distanceBetweenTitleBaselineAndSubtitleBaseline;
  long long v10 = *(_OWORD *)&self->_padding.bottom;
  *((_OWORD *)v5 + 8) = *(_OWORD *)&self->_padding.top;
  *((_OWORD *)v5 + 9) = v10;
  return v5;
}

- (void)setDistanceBetweenTitleBaselineAndSubtitleBaseline:(double)a3
{
  self->_distanceBetweenTitleBaselineAndSubtitleBaseline = a3;
}

- (void)setTitleLabelSpec:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabelSpec, 0);

  objc_storeStrong((id *)&self->_titleLabelSpec, 0);
}

- (void)setSubtitleLabelSpec:(id)a3
{
}

- (double)maximumTitleSubtitleHeight
{
  v3 = [(PXTitleSubtitleLabelSpec *)self titleLabelSpec];
  v4 = [(PXTitleSubtitleLabelSpec *)self subtitleLabelSpec];
  [(PXTitleSubtitleLabelSpec *)self interLabelSpacing];
  double v6 = v5;
  v7 = [v3 font];
  CGRect BoundingBox = CTFontGetBoundingBox(v7);
  double Height = CGRectGetHeight(BoundingBox);
  double v9 = Height * (double)(unint64_t)[v3 numberOfLines];

  long long v10 = [v4 font];
  CGRect v15 = CTFontGetBoundingBox(v10);
  double v11 = CGRectGetHeight(v15);
  double v12 = v11 * (double)(unint64_t)[v4 numberOfLines];

  return ceil(v6 + v9 + v12) + 1.0;
}

- (PXLabelSpec)subtitleLabelSpec
{
  return self->_subtitleLabelSpec;
}

- (PXLabelSpec)titleLabelSpec
{
  return self->_titleLabelSpec;
}

- (double)interLabelSpacing
{
  return self->_interLabelSpacing;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)distanceBetweenTitleBaselineAndSubtitleBaseline
{
  return self->_distanceBetweenTitleBaselineAndSubtitleBaseline;
}

- (void)setInterLabelSpacing:(double)a3
{
  self->_interLabelSpacing = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PXTitleSubtitleLabelSpec;
  unsigned int v5 = [(PXViewSpec *)&v36 isEqual:v4];
  id v6 = v4;
  v7 = v6;
  if (!v5) {
    goto LABEL_16;
  }
  id v8 = [v6 titleLabelSpec];
  id v9 = [(PXTitleSubtitleLabelSpec *)self titleLabelSpec];
  if (v8 == v9)
  {
  }
  else
  {
    long long v10 = v9;
    char v11 = [v8 isEqual:v9];

    if ((v11 & 1) == 0)
    {
LABEL_16:
      BOOL v33 = 0;
      goto LABEL_17;
    }
  }
  id v12 = [v7 subtitleLabelSpec];
  id v13 = [(PXTitleSubtitleLabelSpec *)self subtitleLabelSpec];
  if (v12 == v13)
  {
  }
  else
  {
    v14 = v13;
    char v15 = [v12 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_16;
    }
  }
  [v7 interLabelSpacing];
  double v17 = v16;
  [(PXTitleSubtitleLabelSpec *)self interLabelSpacing];
  if (v17 != v18) {
    goto LABEL_16;
  }
  [v7 distanceBetweenTitleBaselineAndSubtitleBaseline];
  double v20 = v19;
  [(PXTitleSubtitleLabelSpec *)self distanceBetweenTitleBaselineAndSubtitleBaseline];
  if (v20 != v21) {
    goto LABEL_16;
  }
  [v7 padding];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  [(PXTitleSubtitleLabelSpec *)self padding];
  BOOL v33 = 0;
  if (v25 == v34 && v23 == v30 && v29 == v32) {
    BOOL v33 = v27 == v31;
  }
LABEL_17:

  return v33;
}

- (unint64_t)hash
{
  v12.receiver = self;
  v12.super_class = (Class)PXTitleSubtitleLabelSpec;
  unint64_t v3 = [(PXViewSpec *)&v12 hash];
  id v4 = [(PXTitleSubtitleLabelSpec *)self titleLabelSpec];
  uint64_t v5 = [v4 hash];

  id v6 = [(PXTitleSubtitleLabelSpec *)self subtitleLabelSpec];
  uint64_t v7 = v5 ^ [v6 hash] ^ v3;

  [(PXTitleSubtitleLabelSpec *)self distanceBetweenTitleBaselineAndSubtitleBaseline];
  uint64_t v9 = (uint64_t)(v8 * 1000.0);
  [(PXTitleSubtitleLabelSpec *)self padding];
  return v7 ^ (uint64_t)v10 ^ v9;
}

@end