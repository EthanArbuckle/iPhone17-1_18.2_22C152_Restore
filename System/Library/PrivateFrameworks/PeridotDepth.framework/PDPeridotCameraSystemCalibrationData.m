@interface PDPeridotCameraSystemCalibrationData
+ (id)calibrationDataWithPeridotCalib:(id)a3 platformId:(int)a4 sensorVersion:(int)a5;
+ (id)calibrationDataWithPeridotCalibDataDictionary:(id)a3;
- (ADCameraCalibration)peridotCamera;
- (PDPeridotCameraSystemCalibrationData)initWithPeridotModuleCalibration:(id)a3 platformId:(int)a4 sensorVersion:(int)a5;
- (PDPeridotModuleCalibrationData)peridotModule;
- (int)peridotChipRevision;
- (int)platform;
- (void)replacePeridotDistortionModelWithWarperMesh:(id)a3 width:(int64_t)a4 height:(int64_t)a5;
@end

@implementation PDPeridotCameraSystemCalibrationData

- (ADCameraCalibration)peridotCamera
{
  return &self->_peridotCamera->super;
}

+ (id)calibrationDataWithPeridotCalib:(id)a3 platformId:(int)a4 sensorVersion:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  v8 = [[PDPeridotModuleCalibrationData alloc] initWithPeridotCalib:v7];
  if (v8) {
    v9 = [[PDPeridotCameraSystemCalibrationData alloc] initWithPeridotModuleCalibration:v8 platformId:v6 sensorVersion:v5];
  }
  else {
    v9 = 0;
  }

  return v9;
}

- (PDPeridotCameraSystemCalibrationData)initWithPeridotModuleCalibration:(id)a3 platformId:(int)a4 sensorVersion:(int)a5
{
  id v9 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PDPeridotCameraSystemCalibrationData;
  v10 = [(PDPeridotCameraSystemCalibrationData *)&v19 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_peridotModule, a3);
    switch(a4)
    {
      case -1:
        uint64_t v13 = MGGetProductType();
        if (v13 > 2487868871)
        {
          if (v13 <= 2795618602)
          {
            if (v13 == 2487868872 || v13 == 2619317134) {
              goto LABEL_3;
            }
          }
          else
          {
            switch(v13)
            {
              case 2795618603:
                goto LABEL_18;
              case 3241053352:
                goto LABEL_3;
              case 2941181571:
                goto LABEL_19;
            }
          }
          goto LABEL_27;
        }
        if (v13 <= 555503453)
        {
          if (v13 == 133314240) {
            goto LABEL_19;
          }
          if (v13 != 330877086) {
            goto LABEL_27;
          }
          goto LABEL_18;
        }
        if (v13 == 555503454) {
          goto LABEL_3;
        }
        if (v13 == 689804742) {
          goto LABEL_6;
        }
        goto LABEL_27;
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
      case 47:
      case 48:
      case 49:
      case 50:
      case 55:
      case 56:
      case 57:
      case 58:
      case 59:
      case 60:
      case 61:
      case 62:
      case 63:
      case 64:
      case 65:
      case 68:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      case 97:
      case 98:
        goto LABEL_27;
      case 51:
      case 52:
      case 53:
      case 54:
LABEL_3:
        int v12 = 2;
        goto LABEL_20;
      case 66:
      case 67:
LABEL_19:
        int v12 = 1;
        goto LABEL_20;
      case 69:
      case 70:
LABEL_18:
        int v12 = 3;
        goto LABEL_20;
      case 99:
        int v12 = 4;
        goto LABEL_20;
      case 100:
      case 101:
      case 102:
      case 103:
        int v12 = 5;
LABEL_20:
        v11->_platform = v12;
        if (a5 < 3) {
          goto LABEL_29;
        }
        goto LABEL_28;
      default:
        if ((a4 - 231) >= 2)
        {
LABEL_27:
          v11->_platform = -1;
          peridot_depth_log("Warning: PeridotDepth could not resolve platform type");
          if (a5 < 3) {
            goto LABEL_29;
          }
        }
        else
        {
LABEL_6:
          v11->_platform = 0;
          if (a5 < 3) {
            goto LABEL_29;
          }
        }
LABEL_28:
        peridot_depth_log("Warning: unknown SensorVersion (%d)", a5);
LABEL_29:
        v11->_peridotChipRevision = a5;
        v14 = [(PDPeridotModuleCalibrationData *)v11->_peridotModule calib];
        uint64_t v16 = peridot::CalibManager::getPeridotCamera(v14, v15);
        peridotCamera = v11->_peridotCamera;
        v11->_peridotCamera = (ADMutableCameraCalibration *)v16;

        break;
    }
  }

  return v11;
}

- (int)platform
{
  return self->_platform;
}

- (PDPeridotModuleCalibrationData)peridotModule
{
  return self->_peridotModule;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peridotModule, 0);
  objc_storeStrong((id *)&self->_peridotCamera, 0);
}

- (int)peridotChipRevision
{
  return self->_peridotChipRevision;
}

- (void)replacePeridotDistortionModelWithWarperMesh:(id)a3 width:(int64_t)a4 height:(int64_t)a5
{
  id v18 = a3;
  peridot_depth_log("Replacing Jasper distortion model with a warper mesh");
  if (a4 != 85 || a5 != 109)
  {
    v15 = (void *)MEMORY[0x263EFF940];
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"warperMesh dimensions must be %lu%lu", 85, 109);
    id v17 = [v15 exceptionWithName:*MEMORY[0x263EFF4A0] reason:v16 userInfo:0];

    objc_exception_throw(v17);
  }
  v8 = +[PDUserDefaults defaults];
  char v9 = [v8 ignoreWarperMesh];

  if (v9)
  {
    peridot_depth_log("WARNING! Warper mesh set, but ignored due to defaults write");
  }
  else
  {
    v10 = (void *)[objc_alloc(MEMORY[0x263F26D00]) initWithWarperMesh:v18 type:1 width:85 height:109];
    [(ADMutableCameraCalibration *)self->_peridotCamera setDistortionModel:v10];
  }
  v11 = +[PDUserDefaults defaults];
  int v12 = [v11 dumpWarperMeshesPath];

  if (v12)
  {
    uint64_t v13 = +[PDInternalUtils currTimeAsString];
    v14 = [NSString stringWithFormat:@"%@/%@_Warper.bin", v12, v13];
    [v18 writeToFile:v14 atomically:1];
  }
}

+ (id)calibrationDataWithPeridotCalibDataDictionary:(id)a3
{
  id v3 = a3;
  v4 = [[PDPeridotModuleCalibrationData alloc] initWithCalibrationDictionary:v3];
  if (v4)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:@"PlatformId"];
    uint64_t v6 = v5;
    if (v5) {
      uint64_t v7 = [v5 intValue];
    }
    else {
      uint64_t v7 = 0;
    }
    char v9 = [v3 objectForKeyedSubscript:@"SensorVersion"];
    v10 = v9;
    if (v9) {
      uint64_t v11 = [v9 intValue];
    }
    else {
      uint64_t v11 = 0;
    }
    v8 = [[PDPeridotCameraSystemCalibrationData alloc] initWithPeridotModuleCalibration:v4 platformId:v7 sensorVersion:v11];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end