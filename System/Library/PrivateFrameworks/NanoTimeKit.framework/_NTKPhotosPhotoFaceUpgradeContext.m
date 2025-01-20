@interface _NTKPhotosPhotoFaceUpgradeContext
- (NSString)albumIdentifier;
- (NSString)description;
- (NTKComplication)bottomComplication;
- (NTKComplication)topComplication;
- (NTKPigmentEditOption)colorOption;
- (_NTKPhotosPhotoFaceUpgradeContext)initWithReader:(id)a3 contentOption:(id)a4 positionOption:(id)a5 topComplication:(id)a6 bottomComplication:(id)a7 colorOption:(id)a8;
- (id)itemAtIndex:(unint64_t)a3;
- (int64_t)colorEffect;
- (int64_t)contentType;
- (int64_t)typeface;
- (unint64_t)numberOfItems;
@end

@implementation _NTKPhotosPhotoFaceUpgradeContext

- (_NTKPhotosPhotoFaceUpgradeContext)initWithReader:(id)a3 contentOption:(id)a4 positionOption:(id)a5 topComplication:(id)a6 bottomComplication:(id)a7 colorOption:(id)a8
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v47 = a6;
  id v18 = a7;
  id v19 = a8;
  v48.receiver = self;
  v48.super_class = (Class)_NTKPhotosPhotoFaceUpgradeContext;
  v20 = [(_NTKPhotosPhotoFaceUpgradeContext *)&v48 init];
  v21 = v20;
  if (!v20) {
    goto LABEL_25;
  }
  objc_storeStrong((id *)&v20->_reader, a3);
  objc_storeStrong((id *)&v21->_topComplication, a6);
  objc_storeStrong((id *)&v21->_bottomComplication, a7);
  v21->_contentType = 0;
  uint64_t v22 = [v16 photosContent];
  if (v22 == 2)
  {
    uint64_t v23 = 3;
LABEL_8:
    v21->_contentType = v23;
    goto LABEL_15;
  }
  if (v22 == 1)
  {
    uint64_t v23 = 1;
    goto LABEL_8;
  }
  if (v22)
  {
    if (v21->_contentType != 2) {
      goto LABEL_15;
    }
  }
  else
  {
    v21->_contentType = 2;
  }
  uint64_t v24 = [v15 assetCollectionIdentifier];
  albumIdentifier = v21->_albumIdentifier;
  v21->_albumIdentifier = (NSString *)v24;

  if (!v21->_albumIdentifier)
  {
    v26 = [MEMORY[0x1E4F19A30] currentDevice];
    v27 = [v26 nrDevice];

    v46 = (void *)[objc_alloc(MEMORY[0x1E4F79CC8]) initWithCollectionTarget:1 device:v27];
    v28 = [v46 assetCollections];
    v29 = [v28 anyObject];

    if (v29)
    {
      v44 = (void *)MEMORY[0x1E4F38EE8];
      NTK_npto_uuid(v29);
      v30 = v45 = v27;
      v31 = [v30 UUIDString];
      uint64_t v43 = [v44 localIdentifierWithUUID:v31];

      v32 = (NSString *)v43;
      v27 = v45;
    }
    else
    {
      v32 = 0;
    }

    v33 = v21->_albumIdentifier;
    v21->_albumIdentifier = v32;
  }
LABEL_15:
  v21->_timeAlignment = 0;
  uint64_t v34 = objc_msgSend(v17, "alignment", v43);
  if (v34)
  {
    if (v34 != 1) {
      goto LABEL_20;
    }
    uint64_t v35 = 4;
  }
  else
  {
    uint64_t v35 = 2;
  }
  v21->_timeAlignment = v35;
LABEL_20:
  v36 = [v19 optionName];
  v37 = +[NTKPhotosColorEditOption originalColorName];
  int v38 = [v36 isEqualToString:v37];

  if (v38)
  {
    v21->_colorEffect = 0;
  }
  else
  {
    int v39 = [v19 isMultitoneOption];
    uint64_t v40 = 3;
    if (!v39) {
      uint64_t v40 = 1;
    }
    v21->_colorEffect = v40;
    objc_storeStrong((id *)&v21->_colorOption, a8);
  }
LABEL_25:
  v41 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v21;
    _os_log_impl(&dword_1BC5A9000, v41, OS_LOG_TYPE_INFO, "Created %@", buf, 0xCu);
  }

  return v21;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"_NTKPhotosPhotoFaceUpgradeContext[content=%ld, album=%@, %ld photos]", self->_contentType, self->_albumIdentifier, -[NTKPhotosReader count](self->_reader, "count")];
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (NSString)albumIdentifier
{
  return self->_albumIdentifier;
}

- (NTKComplication)topComplication
{
  return self->_topComplication;
}

- (NTKComplication)bottomComplication
{
  return self->_bottomComplication;
}

- (int64_t)colorEffect
{
  return self->_colorEffect;
}

- (NTKPigmentEditOption)colorOption
{
  return self->_colorOption;
}

- (int64_t)typeface
{
  return 0;
}

- (unint64_t)numberOfItems
{
  return [(NTKPhotosReader *)self->_reader count];
}

- (id)itemAtIndex:(unint64_t)a3
{
  v4 = [(NTKPhotosReader *)self->_reader objectAtIndexedSubscript:a3];
  if (v4) {
    v5 = [[_NTKPhotosPhotoFaceUpgradeItemContext alloc] initWithPhoto:v4 timeAlignment:self->_timeAlignment];
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorOption, 0);
  objc_storeStrong((id *)&self->_bottomComplication, 0);
  objc_storeStrong((id *)&self->_topComplication, 0);
  objc_storeStrong((id *)&self->_reader, 0);

  objc_storeStrong((id *)&self->_albumIdentifier, 0);
}

@end