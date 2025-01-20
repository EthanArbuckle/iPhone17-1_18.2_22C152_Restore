@interface PXStoryViewChromeTitleInfo
- (BOOL)isEqual:(id)a3;
- (NSString)artistName;
- (NSString)collectionSubtitle;
- (NSString)collectionTitle;
- (NSString)dateName;
- (NSString)locationName;
- (NSString)songName;
- (NSString)subtitle;
- (NSString)subtitleSymbolName;
- (NSString)title;
- (PXStoryViewChromeTitleInfo)init;
- (PXStoryViewChromeTitleInfo)initWithCollectionTitle:(id)a3 collectionSubtitle:(id)a4 locationName:(id)a5 dateName:(id)a6 songName:(id)a7 artistName:(id)a8 title:(id)a9 subtitle:(id)a10 subtitleSymbolName:(id)a11;
- (unint64_t)hash;
@end

@implementation PXStoryViewChromeTitleInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleSymbolName, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_songName, 0);
  objc_storeStrong((id *)&self->_dateName, 0);
  objc_storeStrong((id *)&self->_locationName, 0);
  objc_storeStrong((id *)&self->_collectionSubtitle, 0);
  objc_storeStrong((id *)&self->_collectionTitle, 0);
}

- (NSString)subtitleSymbolName
{
  return self->_subtitleSymbolName;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (NSString)songName
{
  return self->_songName;
}

- (NSString)dateName
{
  return self->_dateName;
}

- (NSString)locationName
{
  return self->_locationName;
}

- (NSString)collectionSubtitle
{
  return self->_collectionSubtitle;
}

- (NSString)collectionTitle
{
  return self->_collectionTitle;
}

- (unint64_t)hash
{
  v3 = [(PXStoryViewChromeTitleInfo *)self collectionTitle];
  uint64_t v4 = [v3 hash];
  v5 = [(PXStoryViewChromeTitleInfo *)self locationName];
  uint64_t v6 = v4 ^ (2 * [v5 hash]);
  v7 = [(PXStoryViewChromeTitleInfo *)self subtitle];
  unint64_t v8 = v6 ^ (4 * [v7 hash]);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(PXStoryViewChromeTitleInfo *)self collectionTitle];
    id v7 = [v5 collectionTitle];
    if (v6 == v7)
    {
    }
    else
    {
      int v8 = [v6 isEqualToString:v7];

      if (!v8)
      {
        BOOL v9 = 0;
LABEL_46:

        goto LABEL_47;
      }
    }
    id v10 = [(PXStoryViewChromeTitleInfo *)self collectionSubtitle];
    id v11 = [v5 collectionSubtitle];
    if (v10 == v11)
    {
    }
    else
    {
      int v12 = [v10 isEqualToString:v11];

      if (!v12)
      {
        BOOL v9 = 0;
LABEL_45:

        goto LABEL_46;
      }
    }
    id v13 = [(PXStoryViewChromeTitleInfo *)self locationName];
    id v14 = [v5 locationName];
    v55 = v13;
    if (v13 == v14)
    {
    }
    else
    {
      int v15 = [v13 isEqualToString:v14];

      if (!v15)
      {
        BOOL v9 = 0;
LABEL_44:

        goto LABEL_45;
      }
    }
    id v16 = [(PXStoryViewChromeTitleInfo *)self dateName];
    id v17 = [v5 dateName];
    v53 = v16;
    v54 = v17;
    if (v16 == v17)
    {
    }
    else
    {
      v18 = v17;
      int v19 = [v16 isEqualToString:v17];

      if (!v19)
      {
        BOOL v9 = 0;
        v20 = v53;
LABEL_43:

        goto LABEL_44;
      }
    }
    id v21 = [(PXStoryViewChromeTitleInfo *)self songName];
    id v22 = [v5 songName];
    v50 = v22;
    v51 = v21;
    if (v21 == v22)
    {
    }
    else
    {
      v23 = v22;
      int v24 = [v21 isEqualToString:v22];

      if (!v24)
      {
        BOOL v9 = 0;
        v20 = v53;
LABEL_42:

        goto LABEL_43;
      }
    }
    id v25 = [(PXStoryViewChromeTitleInfo *)self artistName];
    id v26 = [v5 artistName];
    v52 = v25;
    v49 = v26;
    if (v25 == v26)
    {
    }
    else
    {
      v27 = v26;
      int v28 = [v52 isEqualToString:v26];

      if (!v28)
      {
        BOOL v9 = 0;
        v20 = v53;
LABEL_41:

        goto LABEL_42;
      }
    }
    id v29 = [(PXStoryViewChromeTitleInfo *)self title];
    id v30 = [v5 title];
    v47 = v30;
    v48 = v29;
    if (v29 == v30)
    {
    }
    else
    {
      v31 = v30;
      int v32 = [v29 isEqualToString:v30];

      if (!v32)
      {
        BOOL v9 = 0;
        v20 = v53;
LABEL_40:

        goto LABEL_41;
      }
    }
    id v33 = [(PXStoryViewChromeTitleInfo *)self subtitle];
    id v34 = [v5 subtitle];
    v46 = v34;
    if (v33 == v34)
    {
    }
    else
    {
      id v35 = v34;
      v36 = v33;
      v44 = v33;
      v37 = v35;
      int v38 = [v36 isEqualToString:v35];

      id v33 = v44;
      if (!v38)
      {
        BOOL v9 = 0;
        v20 = v53;
LABEL_39:

        goto LABEL_40;
      }
    }
    v39 = [(PXStoryViewChromeTitleInfo *)self subtitleSymbolName];
    v40 = [v5 subtitleSymbolName];
    v45 = v39;
    if (v39 == v40)
    {
      BOOL v9 = 1;
    }
    else
    {
      v41 = v40;
      char v42 = [v39 isEqualToString:v40];
      v40 = v41;
      BOOL v9 = v42;
    }
    v20 = v53;

    goto LABEL_39;
  }
  BOOL v9 = 0;
LABEL_47:

  return v9;
}

- (PXStoryViewChromeTitleInfo)initWithCollectionTitle:(id)a3 collectionSubtitle:(id)a4 locationName:(id)a5 dateName:(id)a6 songName:(id)a7 artistName:(id)a8 title:(id)a9 subtitle:(id)a10 subtitleSymbolName:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  v46.receiver = self;
  v46.super_class = (Class)PXStoryViewChromeTitleInfo;
  id v26 = [(PXStoryViewChromeTitleInfo *)&v46 init];
  if (v26)
  {
    uint64_t v27 = [v17 copy];
    collectionTitle = v26->_collectionTitle;
    v26->_collectionTitle = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    collectionSubtitle = v26->_collectionSubtitle;
    v26->_collectionSubtitle = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    locationName = v26->_locationName;
    v26->_locationName = (NSString *)v31;

    uint64_t v33 = [v20 copy];
    dateName = v26->_dateName;
    v26->_dateName = (NSString *)v33;

    uint64_t v35 = [v21 copy];
    songName = v26->_songName;
    v26->_songName = (NSString *)v35;

    uint64_t v37 = [v22 copy];
    artistName = v26->_artistName;
    v26->_artistName = (NSString *)v37;

    uint64_t v39 = [v23 copy];
    title = v26->_title;
    v26->_title = (NSString *)v39;

    uint64_t v41 = [v24 copy];
    subtitle = v26->_subtitle;
    v26->_subtitle = (NSString *)v41;

    uint64_t v43 = [v25 copy];
    subtitleSymbolName = v26->_subtitleSymbolName;
    v26->_subtitleSymbolName = (NSString *)v43;
  }
  return v26;
}

- (PXStoryViewChromeTitleInfo)init
{
  return [(PXStoryViewChromeTitleInfo *)self initWithCollectionTitle:0 collectionSubtitle:0 locationName:0 dateName:0 songName:0 artistName:0 title:0 subtitle:0 subtitleSymbolName:0];
}

@end