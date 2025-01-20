@interface PVFaceprint
+ (id)faceprintWithFaceprintData:(id)a3 faceprintVersion:(int64_t)a4;
- (BOOL)getDistance:(float *)a3 toOtherFaceprint:(id)a4 error:(id *)a5;
- (NSData)faceprintData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)faceprintVersion;
- (void)_setPropertiesFrom:(id)a3;
- (void)setFaceprintData:(id)a3;
- (void)setFaceprintVersion:(int64_t)a3;
@end

@implementation PVFaceprint

- (void).cxx_destruct
{
}

- (void)setFaceprintData:(id)a3
{
}

- (NSData)faceprintData
{
  return self->_faceprintData;
}

- (void)setFaceprintVersion:(int64_t)a3
{
  self->_faceprintVersion = a3;
}

- (int64_t)faceprintVersion
{
  return self->_faceprintVersion;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v7.receiver = self;
  v7.super_class = (Class)PVFaceprint;
  v4 = [(PVObject *)&v7 description];
  v5 = [v3 stringWithString:v4];

  objc_msgSend(v5, "appendFormat:", @"  faceprintVersion       : %ld\n", self->_faceprintVersion);
  objc_msgSend(v5, "appendFormat:", @"  faceprintData          : <%p> [length: %ld]\n", self->_faceprintData, -[NSData length](self->_faceprintData, "length"));

  return v5;
}

- (BOOL)getDistance:(float *)a3 toOtherFaceprint:(id)a4 error:(id *)a5
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = v8;
  if (a5)
  {
    if (v8) {
      goto LABEL_3;
    }
LABEL_13:
    v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28568];
    v36[0] = @"Cannot get distance between faceprints. Missing faceprint.";
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    v23 = v22;
    uint64_t v24 = -1010;
LABEL_15:
    [v23 errorForPhotoVisionErrorCode:v24 userInfo:v11];
    BOOL v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  uint64_t v30 = 0;
  a5 = (id *)&v30;
  if (!v8) {
    goto LABEL_13;
  }
LABEL_3:
  int64_t v10 = [(PVFaceprint *)self faceprintVersion];
  if (v10 != [v9 faceprintVersion])
  {
    v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F28568];
    v34 = @"Cannot get distance between faceprints with mismatched versions.";
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    v23 = v25;
    uint64_t v24 = -1011;
    goto LABEL_15;
  }
  v11 = [(PVFaceprint *)self faceprintData];
  uint64_t v12 = [v9 faceprintData];
  v13 = (void *)v12;
  if (v11 && v12)
  {
    id v29 = 0;
    v14 = +[PVUtils faceprintFromFaceprintArchive:v11 error:&v29];
    id v15 = v29;
    if (v14)
    {
      id v28 = v15;
      v16 = +[PVUtils faceprintFromFaceprintArchive:v13 error:&v28];
      id v17 = v28;

      if (v16)
      {
        v18 = [v14 computeDistance:v16 withDistanceFunction:0 error:a5];
        v19 = v18;
        BOOL v20 = v18 != 0;
        if (a3 && v18)
        {
          [v18 floatValue];
          *(_DWORD *)a3 = v21;
        }
      }
      else
      {
        [MEMORY[0x1E4F28C58] errorForPhotoVisionErrorCode:-1010 localizedDescription:@"Cannot get distance between faceprints. Missing faceprint." underlyingError:v17];
        BOOL v20 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      [MEMORY[0x1E4F28C58] errorForPhotoVisionErrorCode:-1010 localizedDescription:@"Cannot get distance between faceprints. Missing faceprint." underlyingError:v15];
      BOOL v20 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      id v17 = v15;
    }
  }
  else
  {
    v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    v32 = @"Cannot get distance between faceprints. Missing faceprint data.";
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    [v26 errorForPhotoVisionErrorCode:-1010 userInfo:v17];
    BOOL v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_22:
  return v20;
}

- (void)_setPropertiesFrom:(id)a3
{
  id v4 = a3;
  self->_faceprintVersion = [v4 faceprintVersion];
  id v7 = [v4 faceprintData];

  v5 = (NSData *)[v7 copy];
  faceprintData = self->_faceprintData;
  self->_faceprintData = v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PVFaceprint;
  id v4 = [(PVObject *)&v6 copyWithZone:a3];
  [v4 _setPropertiesFrom:self];
  return v4;
}

+ (id)faceprintWithFaceprintData:(id)a3 faceprintVersion:(int64_t)a4
{
  if (a3)
  {
    id v6 = a3;
    id v7 = (void *)[objc_alloc((Class)a1) initWithLocalIdentifier:0];
    [v7 setFaceprintData:v6];

    [v7 setFaceprintVersion:a4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end