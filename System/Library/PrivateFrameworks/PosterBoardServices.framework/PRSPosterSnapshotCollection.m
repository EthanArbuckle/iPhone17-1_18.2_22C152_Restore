@interface PRSPosterSnapshotCollection
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)_populateInterfaceOrientationFromSurfacesIfPossible;
- (FBSDisplayIdentity)snapshotDisplayIdentity;
- (PRSPosterSnapshot)floatingLayerSnapshot;
- (PRSPosterSnapshot)primaryLayersSnapshot;
- (PRSPosterSnapshotCollection)initWithBSXPCCoder:(id)a3;
- (PRSPosterSnapshotCollection)initWithPrimaryLayersSnapshot:(id)a3 floatingLayerSnapshot:(id)a4 snapshotScale:(double)a5 interfaceStyle:(int64_t)a6 accessibilityContrast:(int64_t)a7;
- (PRSPosterSnapshotCollection)initWithPrimaryLayersSnapshot:(id)a3 floatingLayerSnapshot:(id)a4 snapshotScale:(double)a5 interfaceStyle:(int64_t)a6 accessibilityContrast:(int64_t)a7 interfaceOrientation:(int64_t)a8 displayIdentity:(id)a9;
- (double)snapshotScale;
- (int64_t)accessibilityContrast;
- (int64_t)interfaceOrientation;
- (int64_t)interfaceStyle;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation PRSPosterSnapshotCollection

- (PRSPosterSnapshotCollection)initWithPrimaryLayersSnapshot:(id)a3 floatingLayerSnapshot:(id)a4 snapshotScale:(double)a5 interfaceStyle:(int64_t)a6 accessibilityContrast:(int64_t)a7 interfaceOrientation:(int64_t)a8 displayIdentity:(id)a9
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a9;
  v27.receiver = self;
  v27.super_class = (Class)PRSPosterSnapshotCollection;
  v20 = [(PRSPosterSnapshotCollection *)&v27 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_primaryLayersSnapshot, a3);
    objc_storeStrong((id *)&v21->_floatingLayerSnapshot, a4);
    v21->_snapshotScale = a5;
    v21->_interfaceStyle = a6;
    v21->_accessibilityContrast = a7;
    if (v19)
    {
      v22 = (FBSDisplayIdentity *)v19;
      snapshotDisplayIdentity = v21->_snapshotDisplayIdentity;
      v21->_snapshotDisplayIdentity = v22;
    }
    else
    {
      snapshotDisplayIdentity = (FBSDisplayIdentity *)objc_alloc_init(MEMORY[0x1E4F62970]);
      uint64_t v24 = [(FBSDisplayIdentity *)snapshotDisplayIdentity mainIdentity];
      v25 = v21->_snapshotDisplayIdentity;
      v21->_snapshotDisplayIdentity = (FBSDisplayIdentity *)v24;
    }
    v21->_interfaceOrientation = a8;
    [(PRSPosterSnapshotCollection *)v21 _populateInterfaceOrientationFromSurfacesIfPossible];
  }

  return v21;
}

- (PRSPosterSnapshotCollection)initWithPrimaryLayersSnapshot:(id)a3 floatingLayerSnapshot:(id)a4 snapshotScale:(double)a5 interfaceStyle:(int64_t)a6 accessibilityContrast:(int64_t)a7
{
  return [(PRSPosterSnapshotCollection *)self initWithPrimaryLayersSnapshot:a3 floatingLayerSnapshot:a4 snapshotScale:a6 interfaceStyle:a7 accessibilityContrast:0 interfaceOrientation:0 displayIdentity:a5];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  primaryLayersSnapshot = self->_primaryLayersSnapshot;
  id v5 = a3;
  [v5 encodeObject:primaryLayersSnapshot forKey:@"primaryLayersSnapshot"];
  [v5 encodeObject:self->_floatingLayerSnapshot forKey:@"floatingLayerSnapshot"];
  [v5 encodeDouble:@"snapshotScale" forKey:self->_snapshotScale];
  [v5 encodeInt64:self->_interfaceStyle forKey:@"interfaceStyle"];
  [v5 encodeInt64:self->_accessibilityContrast forKey:@"accessibilityContrast"];
  [v5 encodeObject:self->_snapshotDisplayIdentity forKey:@"snapshotDisplayIdentity"];
  [v5 encodeInt64:self->_interfaceOrientation forKey:@"interfaceOrientation"];
}

- (PRSPosterSnapshotCollection)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryLayersSnapshot"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"floatingLayerSnapshot"];
    [v4 decodeDoubleForKey:@"snapshotScale"];
    double v8 = v7;
    uint64_t v9 = [v4 decodeInt64ForKey:@"interfaceStyle"];
    uint64_t v10 = [v4 decodeInt64ForKey:@"accessibilityContrast"];
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"snapshotDisplayIdentity"];
    int64_t interfaceOrientation = [v4 decodeUInt64ForKey:@"interfaceOrientation"];
    if ((unint64_t)(interfaceOrientation - 1) >= 2)
    {
      if ([(PRSPosterSnapshotCollection *)self _populateInterfaceOrientationFromSurfacesIfPossible])
      {
        int64_t interfaceOrientation = self->_interfaceOrientation;
      }
      else
      {
        v14 = [v5 surface];
        uint64_t v18 = [v14 width];
        v15 = [v5 surface];
        uint64_t v16 = [v15 height];

        if (v18 <= v16) {
          int64_t interfaceOrientation = 1;
        }
        else {
          int64_t interfaceOrientation = 2;
        }
      }
    }
    self = [(PRSPosterSnapshotCollection *)self initWithPrimaryLayersSnapshot:v5 floatingLayerSnapshot:v6 snapshotScale:v9 interfaceStyle:v10 accessibilityContrast:interfaceOrientation interfaceOrientation:v11 displayIdentity:v8];

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_populateInterfaceOrientationFromSurfacesIfPossible
{
  v3 = [(PRSPosterSnapshot *)self->_primaryLayersSnapshot surface];
  id v4 = getkPaperboardIOSurfaceDeviceOrientationPropertiesKey();
  id v5 = [v3 attachmentForKey:v4];

  if (v5)
  {
    v6 = getkPaperboardIOSurfaceDeviceOrientationPropertiesKey();
    double v7 = [v3 attachmentForKey:v6];
    [v7 unsignedIntegerValue];

    BOOL v8 = 1;
    if (BSInterfaceOrientationIsPortrait()) {
      int64_t v9 = 1;
    }
    else {
      int64_t v9 = 2;
    }
    self->_int64_t interfaceOrientation = v9;
  }
  else
  {
    uint64_t v10 = [(PRSPosterSnapshot *)self->_floatingLayerSnapshot surface];
    v11 = getkPaperboardIOSurfaceDeviceOrientationPropertiesKey();
    v12 = [v10 attachmentForKey:v11];

    BOOL v8 = v12 != 0;
    if (v12)
    {
      v13 = getkPaperboardIOSurfaceDeviceOrientationPropertiesKey();
      v14 = [v10 attachmentForKey:v13];
      [v14 unsignedIntegerValue];

      int IsPortrait = BSInterfaceOrientationIsPortrait();
      int64_t v16 = 1;
      if (!IsPortrait) {
        int64_t v16 = 2;
      }
      self->_int64_t interfaceOrientation = v16;
    }
  }
  return v8;
}

- (PRSPosterSnapshot)primaryLayersSnapshot
{
  return self->_primaryLayersSnapshot;
}

- (PRSPosterSnapshot)floatingLayerSnapshot
{
  return self->_floatingLayerSnapshot;
}

- (FBSDisplayIdentity)snapshotDisplayIdentity
{
  return self->_snapshotDisplayIdentity;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (double)snapshotScale
{
  return self->_snapshotScale;
}

- (int64_t)interfaceStyle
{
  return self->_interfaceStyle;
}

- (int64_t)accessibilityContrast
{
  return self->_accessibilityContrast;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotDisplayIdentity, 0);
  objc_storeStrong((id *)&self->_floatingLayerSnapshot, 0);
  objc_storeStrong((id *)&self->_primaryLayersSnapshot, 0);
}

@end