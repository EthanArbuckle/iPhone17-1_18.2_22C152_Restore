@interface RFMapCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCameraDistance;
- (BOOL)hasShowsUserLocation;
- (BOOL)hasSizeFormat;
- (BOOL)isEqual:(id)a3;
- (BOOL)showsUserLocation;
- (NSArray)annotations;
- (NSArray)markers;
- (NSArray)polyline;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFMapCardSection)initWithCoder:(id)a3;
- (RFMapCardSection)initWithProtobuf:(id)a3;
- (double)cameraDistance;
- (id)copyWithZone:(_NSZone *)a3;
- (int)sizeFormat;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAnnotations:(id)a3;
- (void)setCameraDistance:(double)a3;
- (void)setMarkers:(id)a3;
- (void)setPolyline:(id)a3;
- (void)setShowsUserLocation:(BOOL)a3;
- (void)setSizeFormat:(int)a3;
@end

@implementation RFMapCardSection

- (RFMapCardSection)initWithProtobuf:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)RFMapCardSection;
  v5 = [(SFCardSection *)&v46 init];
  if (v5)
  {
    if ([v4 sizeFormat]) {
      -[RFMapCardSection setSizeFormat:](v5, "setSizeFormat:", [v4 sizeFormat]);
    }
    v6 = [v4 markers];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v8 = [v4 markers];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v49 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v43 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[RFMapMarker alloc] initWithProtobuf:*(void *)(*((void *)&v42 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v42 objects:v49 count:16];
      }
      while (v10);
    }

    [(RFMapCardSection *)v5 setMarkers:v7];
    v14 = [v4 annotations];
    if (v14) {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v15 = 0;
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v16 = [v4 annotations];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v48 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v39 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [[RFMapAnnotation alloc] initWithProtobuf:*(void *)(*((void *)&v38 + 1) + 8 * j)];
          if (v21) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v38 objects:v48 count:16];
      }
      while (v18);
    }

    [(RFMapCardSection *)v5 setAnnotations:v15];
    v22 = [v4 polylines];
    v33 = v5;
    if (v22) {
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v23 = 0;
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v24 = [v4 polylines];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v34 objects:v47 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v35;
      do
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v35 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [[SFLatLng alloc] initWithProtobuf:*(void *)(*((void *)&v34 + 1) + 8 * k)];
          if (v29) {
            [v23 addObject:v29];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v34 objects:v47 count:16];
      }
      while (v26);
    }

    v5 = v33;
    [(RFMapCardSection *)v33 setPolyline:v23];
    [v4 cameraDistance];
    if (v30 != 0.0)
    {
      [v4 cameraDistance];
      -[RFMapCardSection setCameraDistance:](v33, "setCameraDistance:");
    }
    if ([v4 showsUserLocation]) {
      -[RFMapCardSection setShowsUserLocation:](v33, "setShowsUserLocation:", [v4 showsUserLocation]);
    }
    v31 = v33;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_polyline, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_markers, 0);
}

- (BOOL)showsUserLocation
{
  return self->_showsUserLocation;
}

- (double)cameraDistance
{
  return self->_cameraDistance;
}

- (void)setPolyline:(id)a3
{
}

- (NSArray)polyline
{
  return self->_polyline;
}

- (void)setAnnotations:(id)a3
{
}

- (NSArray)annotations
{
  return self->_annotations;
}

- (void)setMarkers:(id)a3
{
}

- (NSArray)markers
{
  return self->_markers;
}

- (int)sizeFormat
{
  return self->_sizeFormat;
}

- (unint64_t)hash
{
  v17.receiver = self;
  v17.super_class = (Class)RFMapCardSection;
  unint64_t v3 = [(SFCardSection *)&v17 hash];
  uint64_t v4 = [(RFMapCardSection *)self sizeFormat];
  v5 = [(RFMapCardSection *)self markers];
  uint64_t v6 = v4 ^ [v5 hash];
  id v7 = [(RFMapCardSection *)self annotations];
  uint64_t v8 = v6 ^ [v7 hash];
  uint64_t v9 = [(RFMapCardSection *)self polyline];
  uint64_t v10 = v8 ^ [v9 hash];
  [(RFMapCardSection *)self cameraDistance];
  double v12 = -v11;
  if (v11 >= 0.0) {
    double v12 = v11;
  }
  long double v13 = round(v12);
  unint64_t v14 = (unint64_t)(fmod(v13, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v12 - v13, 0x40uLL);
  unint64_t v15 = v3 ^ v10 ^ [(RFMapCardSection *)self showsUserLocation] ^ v14;

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (RFMapCardSection *)a3;
  if (self == v5)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    if ([(RFMapCardSection *)v5 isMemberOfClass:objc_opt_class()])
    {
      v39.receiver = self;
      v39.super_class = (Class)RFMapCardSection;
      if ([(SFCardSection *)&v39 isEqual:v5])
      {
        uint64_t v6 = v5;
        int v7 = [(RFMapCardSection *)self sizeFormat];
        if (v7 != [(RFMapCardSection *)v6 sizeFormat])
        {
          LOBYTE(v12) = 0;
LABEL_39:

          goto LABEL_40;
        }
        uint64_t v8 = [(RFMapCardSection *)self markers];
        uint64_t v9 = [(RFMapCardSection *)v6 markers];
        if ((v8 == 0) == (v9 != 0))
        {
          LOBYTE(v12) = 0;
LABEL_38:

          goto LABEL_39;
        }
        uint64_t v10 = [(RFMapCardSection *)self markers];
        if (v10)
        {
          double v11 = [(RFMapCardSection *)self markers];
          unint64_t v3 = [(RFMapCardSection *)v6 markers];
          if (![v11 isEqual:v3])
          {
            LOBYTE(v12) = 0;
            goto LABEL_36;
          }
          long long v38 = v11;
        }
        long double v13 = [(RFMapCardSection *)self annotations];
        unint64_t v14 = [(RFMapCardSection *)v6 annotations];
        unint64_t v15 = v14;
        if ((v13 == 0) == (v14 != 0))
        {

          LOBYTE(v12) = 0;
          goto LABEL_35;
        }
        v16 = [(RFMapCardSection *)self annotations];
        if (v16)
        {
          v32 = v15;
          objc_super v17 = v13;
          uint64_t v18 = [(RFMapCardSection *)self annotations];
          long long v35 = [(RFMapCardSection *)v6 annotations];
          long long v36 = v18;
          if (!objc_msgSend(v18, "isEqual:"))
          {
            LOBYTE(v12) = 0;
            long double v13 = v17;
            unint64_t v15 = v32;
            goto LABEL_33;
          }
          long long v34 = v3;
          long long v37 = v16;
          long double v13 = v17;
          unint64_t v15 = v32;
        }
        else
        {
          long long v34 = v3;
          long long v37 = 0;
        }
        uint64_t v19 = [(RFMapCardSection *)self polyline];
        v20 = [(RFMapCardSection *)v6 polyline];
        if ((v19 == 0) == (v20 != 0))
        {

          LOBYTE(v12) = 0;
          v16 = v37;
          unint64_t v3 = v34;
          if (!v37) {
            goto LABEL_34;
          }
          goto LABEL_33;
        }
        double v30 = v20;
        v31 = v19;
        [(RFMapCardSection *)self polyline];
        v33 = v16 = v37;
        if (!v33
          || ([(RFMapCardSection *)self polyline],
              v21 = objc_claimAutoreleasedReturnValue(),
              [(RFMapCardSection *)v6 polyline],
              v28 = v21,
              uint64_t v29 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v21, "isEqual:")))
        {
          unint64_t v3 = v34;
          [(RFMapCardSection *)self cameraDistance];
          double v24 = v23;
          [(RFMapCardSection *)v6 cameraDistance];
          if (vabdd_f64(v24, v25) >= 2.22044605e-16)
          {
            LOBYTE(v12) = 0;
          }
          else
          {
            BOOL v26 = [(RFMapCardSection *)self showsUserLocation];
            BOOL v12 = v26 ^ [(RFMapCardSection *)v6 showsUserLocation] ^ 1;
          }
          v22 = (void *)v29;
          if (!v33)
          {
LABEL_32:

            if (!v37)
            {
LABEL_34:

LABEL_35:
              double v11 = v38;
              if (!v10)
              {
LABEL_37:

                goto LABEL_38;
              }
LABEL_36:

              goto LABEL_37;
            }
LABEL_33:

            goto LABEL_34;
          }
        }
        else
        {
          LOBYTE(v12) = 0;
          unint64_t v3 = v34;
          v22 = (void *)v29;
        }

        goto LABEL_32;
      }
    }
    LOBYTE(v12) = 0;
  }
LABEL_40:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RFMapCardSection;
  id v4 = [(SFCardSection *)&v12 copyWithZone:a3];
  objc_msgSend(v4, "setSizeFormat:", -[RFMapCardSection sizeFormat](self, "sizeFormat"));
  v5 = [(RFMapCardSection *)self markers];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setMarkers:v6];

  int v7 = [(RFMapCardSection *)self annotations];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setAnnotations:v8];

  uint64_t v9 = [(RFMapCardSection *)self polyline];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setPolyline:v10];

  [(RFMapCardSection *)self cameraDistance];
  objc_msgSend(v4, "setCameraDistance:");
  objc_msgSend(v4, "setShowsUserLocation:", -[RFMapCardSection showsUserLocation](self, "showsUserLocation"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFMapCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFMapCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFMapCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFMapCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RFMapCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (RFMapCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SFCardSection *)self init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  int v7 = [[_SFPBCardSection alloc] initWithData:v6];
  uint64_t v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(RFMapCardSection *)v5 setSizeFormat:[(SFCardSection *)v8 sizeFormat]];
    uint64_t v9 = [(SFCardSection *)v8 markers];
    [(RFMapCardSection *)v5 setMarkers:v9];

    uint64_t v10 = [(SFCardSection *)v8 annotations];
    [(RFMapCardSection *)v5 setAnnotations:v10];

    double v11 = [(SFCardSection *)v8 polyline];
    [(RFMapCardSection *)v5 setPolyline:v11];

    [(SFCardSection *)v8 cameraDistance];
    -[RFMapCardSection setCameraDistance:](v5, "setCameraDistance:");
    [(RFMapCardSection *)v5 setShowsUserLocation:[(SFCardSection *)v8 showsUserLocation]];
    objc_super v12 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v12];

    long double v13 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v13];

    unint64_t v14 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v14];

    unint64_t v15 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v15];

    v16 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v16];

    objc_super v17 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v17];

    uint64_t v18 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v18];

    uint64_t v19 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v19];

    v20 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v20];

    v21 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v21];

    v22 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v22];

    double v23 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v23];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    double v24 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v24];

    double v25 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v25];

    BOOL v26 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v26];

    uint64_t v27 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v27];

    v28 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v28];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    uint64_t v29 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v29];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    double v30 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v30];

    v31 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v31];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    v32 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v32];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

- (BOOL)hasShowsUserLocation
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setShowsUserLocation:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_showsUserLocation = a3;
}

- (BOOL)hasCameraDistance
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCameraDistance:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_cameraDistance = a3;
}

- (BOOL)hasSizeFormat
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSizeFormat:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sizeFormat = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end