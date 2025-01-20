@interface AXPhoenixMetadataLogger
- (AXPhoenixMetadataLogger)initWithMetadata:(id)a3;
- (NSDate)startTimestamp;
- (NSDateFormatter)dateFormatter;
- (NSString)metadataFilePath;
- (id)_deviceModelName;
- (id)_fullHardwareConfigurationString;
- (id)_orientationString;
- (void)setDateFormatter:(id)a3;
- (void)setMetadataFilePath:(id)a3;
- (void)setMetadataFilePathUnderDirectory:(id)a3;
- (void)setStartTimestamp:(id)a3;
- (void)writeMetadataToFileWithSensors:(id)a3 withAnnotations:(id)a4 withFalsePositivesMetadata:(id)a5;
@end

@implementation AXPhoenixMetadataLogger

- (AXPhoenixMetadataLogger)initWithMetadata:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)AXPhoenixMetadataLogger;
  v9 = [(AXPhoenixMetadataLogger *)&v7 init];
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    id v6 = (id)[location[0] objectForKeyedSubscript:@"start_timestamp"];
    -[AXPhoenixMetadataLogger setStartTimestamp:](v9, "setStartTimestamp:");
  }
  v5 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (void)setMetadataFilePathUnderDirectory:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = [(AXPhoenixMetadataLogger *)v6 startTimestamp];
  id v3 = +[AXPhoenixDataCollectionUtils createFilename:usingTimestamp:withFileExtension:underDirectory:](AXPhoenixDataCollectionUtils, "createFilename:usingTimestamp:withFileExtension:underDirectory:", @"metadata");
  -[AXPhoenixMetadataLogger setMetadataFilePath:](v6, "setMetadataFilePath:");

  objc_storeStrong(location, 0);
}

- (NSDateFormatter)dateFormatter
{
  if (!self->_dateFormatter)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F08790]);
    -[AXPhoenixMetadataLogger setDateFormatter:](self, "setDateFormatter:");
  }
  dateFormatter = self->_dateFormatter;
  return dateFormatter;
}

- (void)writeMetadataToFileWithSensors:(id)a3 withAnnotations:(id)a4 withFalsePositivesMetadata:(id)a5
{
  v44[26] = *MEMORY[0x263EF8340];
  v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v38 = 0;
  objc_storeStrong(&v38, a4);
  id v37 = 0;
  objc_storeStrong(&v37, a5);
  v9 = [(AXPhoenixMetadataLogger *)v40 dateFormatter];
  [(NSDateFormatter *)v9 setDateFormat:@"YYYY-MM-dd"];

  v11 = [(AXPhoenixMetadataLogger *)v40 dateFormatter];
  v10 = [(AXPhoenixMetadataLogger *)v40 startTimestamp];
  id v36 = -[NSDateFormatter stringFromDate:](v11, "stringFromDate:");

  v12 = [(AXPhoenixMetadataLogger *)v40 dateFormatter];
  [(NSDateFormatter *)v12 setDateFormat:@"HH-mm-ss-SSS"];

  v14 = [(AXPhoenixMetadataLogger *)v40 dateFormatter];
  v13 = [(AXPhoenixMetadataLogger *)v40 startTimestamp];
  id v35 = -[NSDateFormatter stringFromDate:](v14, "stringFromDate:");

  id v34 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%lu", 7);
  id v16 = (id)[MEMORY[0x263F1C5C0] currentDevice];
  id v15 = (id)[v16 identifierForVendor];
  id v33 = (id)[v15 UUIDString];

  id v32 = (id)[v33 substringToIndex:5];
  id v31 = [(AXPhoenixMetadataLogger *)v40 _deviceModelName];
  id v17 = (id)[MEMORY[0x263F08AB0] processInfo];
  id v30 = (id)[v17 operatingSystemVersionString];

  id v19 = (id)[MEMORY[0x263EFFA18] localTimeZone];
  id v18 = (id)[MEMORY[0x263EFF960] currentLocale];
  id v29 = (id)objc_msgSend(v19, "localizedName:locale:", 0);

  id v28 = [(AXPhoenixMetadataLogger *)v40 _orientationString];
  id v27 = [(AXPhoenixMetadataLogger *)v40 _fullHardwareConfigurationString];
  v43[0] = @"username";
  v44[0] = v32;
  v43[1] = @"first_name";
  v44[1] = v32;
  v43[2] = @"last_name";
  v44[2] = v32;
  v43[3] = @"shift_key";
  v44[3] = v34;
  v43[4] = @"tap_location";
  v44[4] = @"unset";
  v43[5] = @"gesture";
  v44[5] = @"unset";
  v43[6] = @"activity";
  v44[6] = @"general";
  v43[7] = @"case";
  v44[7] = @"unknown";
  v43[8] = @"negative_category";
  v44[8] = @"general";
  v43[9] = @"data_collection_source";
  v44[9] = @"carry-fp";
  v43[10] = @"data_collection_phase";
  v44[10] = @"production-2";
  v43[11] = @"data_type";
  v44[11] = @"negative";
  v43[12] = @"date_collected";
  v44[12] = v36;
  v43[13] = @"time_collected";
  v44[13] = v35;
  v43[14] = @"sensors";
  v44[14] = location[0];
  v43[15] = @"annotations";
  v44[15] = v38;
  v43[16] = @"false_positive_metadata";
  v44[16] = v37;
  v43[17] = @"device_model";
  v44[17] = v31;
  v43[18] = @"uuid";
  v44[18] = v33;
  v43[19] = @"os";
  v44[19] = v30;
  v43[20] = @"time_zone";
  v44[20] = v29;
  v43[21] = @"device_orientation";
  v44[21] = v28;
  v43[22] = @"full_hardware_config";
  v44[22] = v27;
  v43[23] = @"accel_sample_rate_hz";
  v44[23] = @"100.00";
  v43[24] = @"gyro_sample_rate_hz";
  v44[24] = @"100.00";
  v43[25] = @"user_accel_sample_rate_hz";
  v44[25] = @"100.00";
  id v26 = (id)[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:26];
  id v20 = objc_alloc(MEMORY[0x263EFF9E0]);
  v21 = [(AXPhoenixMetadataLogger *)v40 metadataFilePath];
  id v25 = (id)objc_msgSend(v20, "initToFileAtPath:append:");

  [v25 open];
  oslog[1] = (os_log_t)3;
  if ([MEMORY[0x263F08900] writeJSONObject:v26 toStream:v25 options:3 error:0])
  {
    oslog[0] = (os_log_t)(id)AXLogBackTap();
    os_log_type_t type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_INFO))
    {
      id v6 = [(AXPhoenixMetadataLogger *)v40 metadataFilePath];
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v42, (uint64_t)"-[AXPhoenixMetadataLogger writeMetadataToFileWithSensors:withAnnotations:withFalsePositivesMetadata:]", (uint64_t)v6);
      _os_log_impl(&dword_2372C8000, oslog[0], type, "[PHOENIX] %s Metadata written to: %@", v42, 0x16u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  else
  {
    os_log_t v22 = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v5 = [(AXPhoenixMetadataLogger *)v40 metadataFilePath];
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v41, (uint64_t)"-[AXPhoenixMetadataLogger writeMetadataToFileWithSensors:withAnnotations:withFalsePositivesMetadata:]", (uint64_t)v5);
      _os_log_error_impl(&dword_2372C8000, v22, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Error writing data collection metadata to: %@", v41, 0x16u);
    }
    objc_storeStrong((id *)&v22, 0);
  }
  [v25 close];
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
}

- (id)_deviceModelName
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v4[2] = self;
  v4[1] = (id)a2;
  bzero(&v5, 0x200uLL);
  uname(&v5);
  v4[0] = (id)[NSString stringWithCString:v5.machine encoding:4];
  id v3 = v4[0];
  objc_storeStrong(v4, 0);
  return v3;
}

- (id)_fullHardwareConfigurationString
{
  return (id)objc_msgSend((id)_fullHardwareConfigurationString___config, "stringByReplacingOccurrencesOfString:withString:", @"/", @"___", a2, self);
}

- (id)_orientationString
{
  id v5 = (id)[MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v6 = [v5 orientation];

  if (v6)
  {
    uint64_t v3 = v6;
    char v2 = 1;
  }
  else
  {
    uint64_t v3 = 0;
    char v2 = 0;
  }
  if ((v2 & 1) == 0)
  {
    switch(v3)
    {
      case 0:
        objc_super v7 = @"UIDeviceOrientationUnknown";
        break;
      case 1:
        objc_super v7 = @"UIDeviceOrientationPortrait";
        break;
      case 2:
        objc_super v7 = @"UIDeviceOrientationPortraitUpsideDown";
        break;
      case 3:
        objc_super v7 = @"UIDeviceOrientationLandscapeLeft";
        break;
      case 4:
        objc_super v7 = @"UIDeviceOrientationLandscapeRight";
        break;
      case 5:
        objc_super v7 = @"UIDeviceOrientationFaceUp";
        break;
      case 6:
        objc_super v7 = @"UIDeviceOrientationFaceDown";
        break;
      default:
        JUMPOUT(0);
    }
  }
  return v7;
}

- (NSDate)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setStartTimestamp:(id)a3
{
}

- (NSString)metadataFilePath
{
  return self->_metadataFilePath;
}

- (void)setMetadataFilePath:(id)a3
{
}

- (void)setDateFormatter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end