@interface PNVisionHelper
+ (id)faceprintFromFaceprintArchive:(id)a3 error:(id *)a4;
- (float)distanceBetweenFaceObservation:(id)a3 andFaceObservation:(id)a4 error:(id *)a5;
- (id)faceObservationFromFace:(id)a3;
- (id)representativenessFromFaceObservations:(id)a3 error:(id *)a4;
@end

@implementation PNVisionHelper

+ (id)faceprintFromFaceprintArchive:(id)a3 error:(id *)a4
{
  v5 = (objc_class *)MEMORY[0x263F1EED8];
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initWithState:v6 error:a4];

  return v7;
}

- (id)representativenessFromFaceObservations:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x263F1EE20] representativenessForFaces:a3 error:a4];
}

- (id)faceObservationFromFace:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 vuObservationID] < 1) {
    uint64_t v4 = [v3 clusterSequenceNumber];
  }
  else {
    uint64_t v4 = [v3 vuObservationID];
  }
  uint64_t v5 = v4;
  if (v4 < 1)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v3;
      _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "Cannot create VNFaceObservation for an unclustered face \"%@\"", buf, 0xCu);
    }
    id v9 = 0;
  }
  else
  {
    id v6 = [v3 faceprintData];
    if (v6)
    {
      id v12 = 0;
      v7 = [(id)objc_opt_class() faceprintFromFaceprintArchive:v6 error:&v12];
      id v8 = v12;
      if (v7)
      {
        id v9 = objc_alloc_init(MEMORY[0x263F1EED0]);
        [v9 setFaceId:v5];
        [v9 setFaceTorsoprint:v7];
        v10 = [v7 faceprint];
        [v9 setFaceprint:v10];
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v14 = v3;
          __int16 v15 = 2112;
          id v16 = v8;
          _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to get VNFaceTorsoprint from faceprint data for face \"%@\", error: %@", buf, 0x16u);
        }
        id v9 = 0;
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v3;
        _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed retrieving faceprint data from face \"%@\"", buf, 0xCu);
      }
      id v9 = 0;
    }
  }
  return v9;
}

- (float)distanceBetweenFaceObservation:(id)a3 andFaceObservation:(id)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 faceprint];
  if (v9
    && (v10 = (void *)v9,
        [v8 faceprint],
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    id v12 = [v7 faceprint];
    v13 = [v8 faceprint];
    id v14 = [v12 computeDistance:v13 withDistanceFunction:0 error:a5];

    if (v14)
    {
      [v14 floatValue];
      float v16 = v15;
    }
    else
    {
      float v16 = 1.0;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        int v18 = 138412546;
        id v19 = v7;
        __int16 v20 = 2112;
        id v21 = v8;
        _os_log_debug_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Failed to get a distance between person \"%@\" and \"%@\"", (uint8_t *)&v18, 0x16u);
      }
    }
  }
  else
  {
    float v16 = 1.0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412546;
      id v19 = v7;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed computing distance between person \"%@\" and \"%@\"", (uint8_t *)&v18, 0x16u);
    }
  }

  return v16;
}

@end