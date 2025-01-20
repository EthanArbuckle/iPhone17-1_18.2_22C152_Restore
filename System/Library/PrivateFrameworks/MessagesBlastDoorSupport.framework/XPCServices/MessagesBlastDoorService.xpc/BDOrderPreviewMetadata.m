@interface BDOrderPreviewMetadata
- (BDOrderPreviewMetadata)initWithOrderData:(id)a3 workingDirectory:(id)a4 error:(id *)a5;
- (BDOrderPreviewMetadataImage)headerImage;
- (BDOrderPreviewMetadataText)primaryText;
- (BDOrderPreviewMetadataText)secondaryText;
- (BDOrderPreviewMetadataText)tertiaryText;
- (CGColor)backgroundColor;
- (void)dealloc;
@end

@implementation BDOrderPreviewMetadata

- (BDOrderPreviewMetadata)initWithOrderData:(id)a3 workingDirectory:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v35.receiver = self;
  v35.super_class = (Class)BDOrderPreviewMetadata;
  v10 = [(BDOrderPreviewMetadata *)&v35 init];
  if (!v10)
  {
LABEL_12:
    v14 = v10;
    goto LABEL_13;
  }
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2050000000;
  v11 = (void *)qword_1000EE090;
  uint64_t v40 = qword_1000EE090;
  if (!qword_1000EE090)
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10000B358;
    v36[3] = &unk_1000E0428;
    v36[4] = &v37;
    sub_10000B358((uint64_t)v36);
    v11 = (void *)v38[3];
  }
  v12 = v11;
  _Block_object_dispose(&v37, 8);
  v13 = (BDOrderPreviewMetadata *)[[v12 alloc] initWithOrderData:v8 workingDirectory:v9 error:a5];
  v14 = v13;
  if (v13)
  {
    v15 = [(BDOrderPreviewMetadata *)v13 headerImage];

    if (v15)
    {
      v16 = [BDOrderPreviewMetadataImage alloc];
      v17 = [(BDOrderPreviewMetadata *)v14 headerImage];
      v18 = [(BDOrderPreviewMetadataImage *)v16 _initWithImage:v17];
      headerImage = v10->_headerImage;
      v10->_headerImage = v18;
    }
    v10->_backgroundColor = CGColorRetain([(BDOrderPreviewMetadata *)v14 backgroundColor]);
    v20 = [BDOrderPreviewMetadataText alloc];
    v21 = [(BDOrderPreviewMetadata *)v14 primaryText];
    v22 = [(BDOrderPreviewMetadataText *)v20 _initWithText:v21];
    primaryText = v10->_primaryText;
    v10->_primaryText = v22;

    v24 = [(BDOrderPreviewMetadata *)v14 secondaryText];

    if (v24)
    {
      v25 = [BDOrderPreviewMetadataText alloc];
      v26 = [(BDOrderPreviewMetadata *)v14 secondaryText];
      v27 = [(BDOrderPreviewMetadataText *)v25 _initWithText:v26];
      secondaryText = v10->_secondaryText;
      v10->_secondaryText = v27;
    }
    v29 = [(BDOrderPreviewMetadata *)v14 tertiaryText];

    if (v29)
    {
      v30 = [BDOrderPreviewMetadataText alloc];
      v31 = [(BDOrderPreviewMetadata *)v14 tertiaryText];
      v32 = [(BDOrderPreviewMetadataText *)v30 _initWithText:v31];
      tertiaryText = v10->_tertiaryText;
      v10->_tertiaryText = v32;
    }
    goto LABEL_12;
  }
LABEL_13:

  return v14;
}

- (void)dealloc
{
  CGColorRelease(self->_backgroundColor);
  v3.receiver = self;
  v3.super_class = (Class)BDOrderPreviewMetadata;
  [(BDOrderPreviewMetadata *)&v3 dealloc];
}

- (BDOrderPreviewMetadataImage)headerImage
{
  return self->_headerImage;
}

- (CGColor)backgroundColor
{
  return self->_backgroundColor;
}

- (BDOrderPreviewMetadataText)primaryText
{
  return self->_primaryText;
}

- (BDOrderPreviewMetadataText)secondaryText
{
  return self->_secondaryText;
}

- (BDOrderPreviewMetadataText)tertiaryText
{
  return self->_tertiaryText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tertiaryText, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);

  objc_storeStrong((id *)&self->_headerImage, 0);
}

@end