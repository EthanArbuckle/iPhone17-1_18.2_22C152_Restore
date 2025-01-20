@interface PKPassAccessCardFrontFaceView
- (id)templateForLayoutMode:(int64_t)a3;
@end

@implementation PKPassAccessCardFrontFaceView

- (id)templateForLayoutMode:(int64_t)a3
{
  PKPassFrontFaceContentSize();
  double v6 = v5;
  v7 = [(PKPassFaceView *)self pass];
  [v7 thumbnailRect];
  CGFloat x = v72.origin.x;
  CGFloat y = v72.origin.y;
  CGFloat width = v72.size.width;
  CGFloat height = v72.size.height;
  if (CGRectIsEmpty(v72))
  {
    [v7 stripRect];
    CGFloat x = v12;
    CGFloat y = v13;
    CGFloat width = v14;
    CGFloat height = v15;
  }
  v73.origin.CGFloat x = x;
  v73.origin.CGFloat y = y;
  v73.size.CGFloat width = width;
  v73.size.CGFloat height = height;
  if (CGRectIsEmpty(v73))
  {
    CGFloat x = *MEMORY[0x1E4F1DAD8];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    CGFloat height = 65.0;
    CGFloat width = v6;
  }
  v16 = objc_alloc_init(PKPassFaceTemplate);
  v17 = [(PKPassFaceTemplate *)v16 defaultFieldTemplate];
  [v17 setTextAlignment:0];

  v18 = [(PKPassFaceTemplate *)v16 defaultFieldTemplate];
  v19 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:11.0];
  [v18 setLabelFont:v19];

  v20 = [(PKPassFaceTemplate *)v16 defaultFieldTemplate];
  [v20 setTextAlignment:0];

  v21 = [MEMORY[0x1E4FB08E0] systemFontOfSize:22.0 weight:*MEMORY[0x1E4FB09E0]];
  uint64_t v22 = *MEMORY[0x1E4FB28C8];
  v23 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8]];
  v24 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v23 size:17.0];

  [v21 leading];
  double v26 = v25;
  [v24 leading];
  [v21 lineHeight];
  PKFloatCeilToPixel();
  double v70 = v27;
  [v24 lineHeight];
  PKFloatCeilToPixel();
  double v69 = v28;
  [v21 ascender];
  double v68 = v6;
  double v30 = v29;
  [v21 capHeight];
  v32.n128_u64[0] = 15.0;
  v33.n128_f64[0] = v31 - v30 + 15.0;
  PKFloatFloorToPixel(v33, v32);
  double v35 = v34;
  [v21 descender];
  double v37 = v26 - v36;
  [v24 ascender];
  CGFloat v38 = width;
  CGFloat v39 = x;
  double v41 = v40;
  [v24 capHeight];
  v43.n128_u64[0] = 12.0;
  v44.n128_f64[0] = 12.0 - (v37 + v41 - v42);
  PKFloatFloorToPixel(v44, v43);
  double v46 = fmax(v45, 0.0);
  v47 = objc_alloc_init(PKPassBucketTemplate);
  [(PKPassBucketTemplate *)v47 setBucketAlignment:3];
  v74.origin.CGFloat x = v39;
  v74.origin.CGFloat y = y;
  v74.size.CGFloat width = v38;
  v74.size.CGFloat height = height;
  -[PKPassBucketTemplate setBucketRect:](v47, "setBucketRect:", 15.0, v35 + CGRectGetMaxY(v74), v68 + -30.0, v69 + v70 + v46);
  [(PKPassBucketTemplate *)v47 setMaxFields:1];
  uint64_t v48 = [(PKPassBucketTemplate *)v47 defaultFieldTemplate];
  [(id)v48 setTextAlignment:1];
  [(id)v48 setValueSignificant:1];
  [(id)v48 setSuppressesEmptyLabel:1];
  [(id)v48 setLabelCaseStyle:3];
  PKFloatRoundToPixel();
  objc_msgSend((id)v48, "setVerticalPadding:");
  [(id)v48 setValueFont:v21];
  [(id)v48 setLabelFont:v24];
  [(PKPassFaceTemplate *)v16 addBucketTemplate:v47];

  LODWORD(v48) = a3 == 0;
  v49 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28E0]];
  v50 = [v49 fontDescriptorWithSymbolicTraits:2];

  v51 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v50 size:11.0];
  v52 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v22];

  v53 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v52 size:17.0];

  [v51 leading];
  [v53 leading];
  [v51 lineHeight];
  PKFloatCeilToPixel();
  double v55 = v54;
  [v53 lineHeight];
  PKFloatCeilToPixel();
  double v57 = v56;
  v58 = objc_alloc_init(PKPassBucketTemplate);

  [(PKPassBucketTemplate *)v58 setBucketAlignment:3];
  double v59 = v55 + -1.0 + v57;
  -[PKPassBucketTemplate setBucketRect:](v58, "setBucketRect:", 15.0, dbl_1A0443350[v48], v68 + -30.0, v59);
  [(PKPassBucketTemplate *)v58 setMaxFields:1];
  v60 = [(PKPassBucketTemplate *)v58 defaultFieldTemplate];
  [v60 setLabelFont:v51];

  v61 = [(PKPassBucketTemplate *)v58 defaultFieldTemplate];
  [v61 setValueFont:v53];

  v62 = [(PKPassBucketTemplate *)v58 defaultFieldTemplate];
  PKFloatRoundToPixel();
  objc_msgSend(v62, "setVerticalPadding:");

  [(PKPassFaceTemplate *)v16 addBucketTemplate:v58];
  v63 = objc_alloc_init(PKPassBucketTemplate);

  [(PKPassBucketTemplate *)v63 setBucketAlignment:3];
  -[PKPassBucketTemplate setBucketRect:](v63, "setBucketRect:", 15.0, dbl_1A0443360[v48], v68 + -30.0, v59);
  [(PKPassBucketTemplate *)v63 setMinFieldPadding:12.0];
  [(PKPassBucketTemplate *)v63 setMaxFields:4];
  v64 = [(PKPassBucketTemplate *)v63 defaultFieldTemplate];
  [v64 setLabelFont:v51];

  v65 = [(PKPassBucketTemplate *)v63 defaultFieldTemplate];
  [v65 setValueFont:v53];

  v66 = [(PKPassBucketTemplate *)v63 defaultFieldTemplate];
  PKFloatRoundToPixel();
  objc_msgSend(v66, "setVerticalPadding:");

  [(PKPassFaceTemplate *)v16 addBucketTemplate:v63];

  return v16;
}

@end