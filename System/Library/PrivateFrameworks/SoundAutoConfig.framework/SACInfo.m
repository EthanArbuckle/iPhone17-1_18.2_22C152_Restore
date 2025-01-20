@interface SACInfo
+ (BOOL)supportsSecureCoding;
+ (id)calibrationModeDescription:(unint64_t)a3;
- (NSArray)companionInfo;
- (NSArray)lfeqIR;
- (NSNumber)angle;
- (NSNumber)calibrationMode;
- (NSNumber)roomGain;
- (NSNumber)spatialAudio;
- (NSString)position;
- (NSString)role;
- (SACInfo)init;
- (SACInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAngle:(id)a3;
- (void)setCalibrationMode:(id)a3;
- (void)setCompanionInfo:(id)a3;
- (void)setLfeqIR:(id)a3;
- (void)setPosition:(id)a3;
- (void)setRole:(id)a3;
- (void)setRoomGain:(id)a3;
- (void)setSpatialAudio:(id)a3;
@end

@implementation SACInfo

- (SACInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)SACInfo;
  return [(SACInfo *)&v3 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[SACInfo allocWithZone:a3] init];
  v5 = [(SACInfo *)self angle];
  v6 = (void *)[v5 copy];
  [(SACInfo *)v4 setAngle:v6];

  v7 = [(SACInfo *)self position];
  v8 = (void *)[v7 copy];
  [(SACInfo *)v4 setPosition:v8];

  v9 = [(SACInfo *)self role];
  v10 = (void *)[v9 copy];
  [(SACInfo *)v4 setRole:v10];

  v11 = [(SACInfo *)self roomGain];
  v12 = (void *)[v11 copy];
  [(SACInfo *)v4 setRoomGain:v12];

  id v13 = objc_alloc(MEMORY[0x263EFF980]);
  v14 = [(SACInfo *)self lfeqIR];
  v15 = (void *)[v13 initWithArray:v14 copyItems:1];
  [(SACInfo *)v4 setLfeqIR:v15];

  v16 = [(SACInfo *)self spatialAudio];
  v17 = (void *)[v16 copy];
  [(SACInfo *)v4 setSpatialAudio:v17];

  v18 = [(SACInfo *)self calibrationMode];
  v19 = (void *)[v18 copy];
  [(SACInfo *)v4 setCalibrationMode:v19];

  id v20 = objc_alloc(MEMORY[0x263EFF980]);
  v21 = [(SACInfo *)self companionInfo];
  v22 = (void *)[v20 initWithArray:v21 copyItems:1];
  [(SACInfo *)v4 setCompanionInfo:v22];

  return v4;
}

- (SACInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SACInfo *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"lfeqImpulseResponse"];
    [(SACInfo *)v5 setLfeqIR:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"angle"];
    [(SACInfo *)v5 setAngle:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"position"];
    [(SACInfo *)v5 setPosition:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"role"];
    [(SACInfo *)v5 setRole:v12];

    id v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"roomGain"];
    [(SACInfo *)v5 setRoomGain:v13];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"calibrationMode"];
    [(SACInfo *)v5 setCalibrationMode:v14];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"spatialAudio"];
    [(SACInfo *)v5 setSpatialAudio:v15];

    v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v19 = [v4 decodeObjectOfClasses:v18 forKey:@"companionInfo"];
    [(SACInfo *)v5 setCompanionInfo:v19];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  id v4 = [(SACInfo *)self lfeqIR];
  [v12 encodeObject:v4 forKey:@"lfeqImpulseResponse"];

  v5 = [(SACInfo *)self angle];
  [v12 encodeObject:v5 forKey:@"angle"];

  v6 = [(SACInfo *)self position];
  [v12 encodeObject:v6 forKey:@"position"];

  uint64_t v7 = [(SACInfo *)self role];
  [v12 encodeObject:v7 forKey:@"role"];

  v8 = [(SACInfo *)self roomGain];
  [v12 encodeObject:v8 forKey:@"roomGain"];

  v9 = [(SACInfo *)self calibrationMode];
  [v12 encodeObject:v9 forKey:@"calibrationMode"];

  v10 = [(SACInfo *)self spatialAudio];
  [v12 encodeObject:v10 forKey:@"spatialAudio"];

  v11 = [(SACInfo *)self companionInfo];
  [v12 encodeObject:v11 forKey:@"companionInfo"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)calibrationModeDescription:(unint64_t)a3
{
  if ((a3 & 2) != 0)
  {
    objc_super v3 = @"Full LF";
    if ((a3 & 4) != 0)
    {
LABEL_8:
      objc_super v3 = [NSString stringWithFormat:@"%@ + %@", v3, @"Full HF"];
    }
  }
  else
  {
    if ((a3 & 1) == 0)
    {
      if ((a3 & 4) != 0) {
        objc_super v3 = @"Full HF";
      }
      else {
        objc_super v3 = 0;
      }
      goto LABEL_10;
    }
    objc_super v3 = @"Partial LF";
    if ((a3 & 4) != 0) {
      goto LABEL_8;
    }
  }
LABEL_10:
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = @"None";
  }
  v5 = v4;

  return v5;
}

- (id)description
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  objc_msgSend(v3, "appendFormat:", @"SACInfo <%lu> {\n", -[SACInfo hash](self, "hash"));
  id v4 = [(SACInfo *)self angle];

  if (v4)
  {
    v5 = [(SACInfo *)self angle];
    [v5 floatValue];
    objc_msgSend(v3, "appendFormat:", @"angle = %1.0f\n", v6);
  }
  uint64_t v7 = [(SACInfo *)self position];

  if (v7)
  {
    v8 = [(SACInfo *)self position];
    [v3 appendFormat:@"position = %@\n", v8];
  }
  v9 = [(SACInfo *)self role];

  if (v9)
  {
    v10 = [(SACInfo *)self role];
    [v3 appendFormat:@"role = %@\n", v10];
  }
  v11 = [(SACInfo *)self roomGain];

  if (v11)
  {
    id v12 = [(SACInfo *)self roomGain];
    [v3 appendFormat:@"room gain = %@\n", v12];
  }
  id v13 = [(SACInfo *)self calibrationMode];

  if (v13)
  {
    v14 = [(SACInfo *)self calibrationMode];
    v15 = +[SACInfo calibrationModeDescription:](SACInfo, "calibrationModeDescription:", [v14 unsignedIntegerValue]);
    [v3 appendFormat:@"calibration level = %@\n", v15];
  }
  v16 = [(SACInfo *)self lfeqIR];

  if (v16)
  {
    uint64_t v17 = [(SACInfo *)self lfeqIR];
    objc_msgSend(v3, "appendFormat:", @"lfeqIR = NSArray of Size %d\n", objc_msgSend(v17, "count"));
  }
  v18 = [(SACInfo *)self companionInfo];
  if (v18)
  {
    v19 = [(SACInfo *)self role];
    if (v19)
    {
      id v20 = [(SACInfo *)self role];
      char v21 = [v20 isEqualToString:@"solo"];

      if ((v21 & 1) == 0)
      {
        [v3 appendFormat:@"companion info = {\n"];
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        v22 = [(SACInfo *)self companionInfo];
        uint64_t v23 = [v22 countByEnumeratingWithState:&v48 objects:v52 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v49;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v49 != v24) {
                objc_enumerationMutation(v22);
              }
              v26 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              v27 = [v26 role];
              BOOL v28 = v27 == 0;

              if (!v28)
              {
                v29 = [v26 role];
                [v3 appendFormat:@"\tCompanion - %@ ", v29];
              }
              v30 = [v26 position];
              BOOL v31 = v30 == 0;

              if (!v31)
              {
                v32 = [v26 position];
                [v3 appendFormat:@"\tposition = %@ ", v32];
              }
              v33 = [v26 angle];
              BOOL v34 = v33 == 0;

              if (!v34)
              {
                v35 = [v26 angle];
                [v35 floatValue];
                objc_msgSend(v3, "appendFormat:", @"\tangle = %1.0f ", v36);
              }
              v37 = [v26 roomGain];
              BOOL v38 = v37 == 0;

              if (!v38)
              {
                v39 = [v26 roomGain];
                [v3 appendFormat:@"\troom gain = %@ ", v39];
              }
              v40 = [v26 calibrationMode];
              BOOL v41 = v40 == 0;

              if (!v41)
              {
                v42 = [v26 calibrationMode];
                v43 = +[SACInfo calibrationModeDescription:](SACInfo, "calibrationModeDescription:", [v42 unsignedIntegerValue]);
                [v3 appendFormat:@"\tcalibration level = %@ ", v43];
              }
              v44 = [v26 lfeqIR];
              BOOL v45 = v44 == 0;

              if (!v45)
              {
                v46 = [v26 lfeqIR];
                objc_msgSend(v3, "appendFormat:", @"\tlfeqIR = NSArray of Size %d ", objc_msgSend(v46, "count"));
              }
              [v3 appendFormat:@"\n"];
            }
            uint64_t v23 = [v22 countByEnumeratingWithState:&v48 objects:v52 count:16];
          }
          while (v23);
        }

        [v3 appendFormat:@"  }\n"];
      }
    }
    else
    {
    }
  }
  [v3 appendString:@"}"];

  return v3;
}

- (NSNumber)angle
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAngle:(id)a3
{
}

- (NSString)position
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPosition:(id)a3
{
}

- (NSString)role
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRole:(id)a3
{
}

- (NSNumber)roomGain
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRoomGain:(id)a3
{
}

- (NSArray)lfeqIR
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLfeqIR:(id)a3
{
}

- (NSNumber)spatialAudio
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSpatialAudio:(id)a3
{
}

- (NSNumber)calibrationMode
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCalibrationMode:(id)a3
{
}

- (NSArray)companionInfo
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCompanionInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionInfo, 0);
  objc_storeStrong((id *)&self->_calibrationMode, 0);
  objc_storeStrong((id *)&self->_spatialAudio, 0);
  objc_storeStrong((id *)&self->_lfeqIR, 0);
  objc_storeStrong((id *)&self->_roomGain, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_position, 0);

  objc_storeStrong((id *)&self->_angle, 0);
}

@end