@interface SWConfigurationSerializer
- (BOOL)isNetworkReachableForStatus:(int64_t)a3;
- (id)serializeWebContentConfiguration:(id)a3;
- (id)serializedRectFromCGRect:(CGRect)a3;
@end

@implementation SWConfigurationSerializer

- (id)serializeWebContentConfiguration:(id)a3
{
  v88[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v5 = [MEMORY[0x263EFF9A0] dictionary];
    v6 = [v4 identifier];

    if (v6)
    {
      v7 = [v4 identifier];
      [v5 setObject:v7 forKey:@"identifier"];
    }
    v8 = [v4 storeFront];

    if (v8)
    {
      v9 = [v4 storeFront];
      [v5 setObject:v9 forKey:@"storeFront"];
    }
    v10 = [v4 locale];

    if (v10)
    {
      v11 = [v4 locale];
      v12 = [v11 localeIdentifier];
      [v5 setObject:v12 forKey:@"locale"];
    }
    v13 = [v4 contentEnvironment];

    if (v13)
    {
      v14 = [v4 contentEnvironment];
      [v5 setObject:v14 forKey:@"environment"];
    }
    v15 = [v4 contentSizeCategory];

    if (v15)
    {
      v16 = [v4 contentSizeCategory];
      [v5 setObject:v16 forKey:@"dynamicType"];
    }
    v17 = [v4 location];

    if (v17)
    {
      v18 = [MEMORY[0x263EFF9A0] dictionary];
      v19 = [v4 location];
      v20 = [v19 URL];
      v21 = [v20 absoluteString];

      if (v21)
      {
        v22 = [v4 location];
        v23 = [v22 URL];
        v24 = [v23 absoluteString];
        [v18 setObject:v24 forKey:@"URL"];
      }
      v25 = [v4 location];
      v26 = [v25 context];

      if (v26)
      {
        v27 = [v4 location];
        v28 = [v27 context];
        [v18 setObject:v28 forKey:@"context"];
      }
      [v5 setObject:v18 forKey:@"location"];
    }
    v29 = [v4 sourceURL];
    v30 = [v29 absoluteString];

    if (v30)
    {
      v31 = [v4 sourceURL];
      v32 = [v31 absoluteString];
      [v5 setObject:v32 forKey:@"sourceURL"];
    }
    v33 = [v4 systemVersion];

    if (v33)
    {
      v34 = [v4 systemVersion];
      [v5 setObject:v34 forKey:@"systemVersion"];
    }
    v35 = [v4 appVersion];

    if (v35)
    {
      v36 = [v4 appVersion];
      [v5 setObject:v36 forKey:@"appVersion"];
    }
    v37 = [v4 dataSources];
    uint64_t v38 = [v37 count];

    if (v38)
    {
      v39 = [MEMORY[0x263EFF9A0] dictionary];
      v40 = [v4 dataSources];
      v83[0] = MEMORY[0x263EF8330];
      v83[1] = 3221225472;
      v83[2] = __62__SWConfigurationSerializer_serializeWebContentConfiguration___block_invoke;
      v83[3] = &unk_2646FFC78;
      id v84 = v39;
      id v41 = v39;
      [v40 enumerateKeysAndObjectsUsingBlock:v83];

      [v5 setObject:v41 forKey:@"dataSources"];
    }
    v87[0] = @"width";
    v42 = NSNumber;
    [v4 canvasSize];
    v43 = objc_msgSend(v42, "numberWithDouble:");
    v87[1] = @"height";
    v88[0] = v43;
    v44 = NSNumber;
    [v4 canvasSize];
    v46 = [v44 numberWithDouble:v45];
    v88[1] = v46;
    v47 = [NSDictionary dictionaryWithObjects:v88 forKeys:v87 count:2];

    [v5 setObject:v47 forKey:@"canvasSize"];
    [v4 contentFrame];
    v48 = -[SWConfigurationSerializer serializedRectFromCGRect:](self, "serializedRectFromCGRect:");
    [v5 setObject:v48 forKey:@"contentFrame"];
    v49 = [v4 keyboardConfiguration];

    if (v49)
    {
      [v4 keyboardConfiguration];
      v50 = v81 = v47;
      v85[0] = @"keyboardFrame";
      [v50 keyboardFrame];
      v79 = -[SWConfigurationSerializer serializedRectFromCGRect:](self, "serializedRectFromCGRect:");
      v86[0] = v79;
      v85[1] = @"inputAccessoryViewFrame";
      [v50 inputAccessoryViewFrame];
      v78 = -[SWConfigurationSerializer serializedRectFromCGRect:](self, "serializedRectFromCGRect:");
      v86[1] = v78;
      v85[2] = @"isKeyboardSplit";
      v51 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v50, "isKeyboardSplit"));
      v86[2] = v51;
      v85[3] = @"isKeyboardFloating";
      objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v50, "isKeyboardFloating"));
      v52 = v80 = v48;
      v86[3] = v52;
      v85[4] = @"isHardwareKeyboard";
      v53 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v50, "isHardwareKeyboard"));
      v86[4] = v53;
      v85[5] = @"isKeyboardVisible";
      v54 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v50, "isKeyboardVisible"));
      v86[5] = v54;
      v85[6] = @"isPencilInputExpected";
      v55 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v50, "isPencilInputExpected"));
      v86[6] = v55;
      v56 = [NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:7];

      v48 = v80;
      [v5 setObject:v56 forKey:@"keyboardInfo"];

      v47 = v81;
    }
    v57 = objc_msgSend(NSNumber, "numberWithBool:", -[SWConfigurationSerializer isNetworkReachableForStatus:](self, "isNetworkReachableForStatus:", objc_msgSend(v4, "networkStatus")));
    [v5 setObject:v57 forKey:@"isNetworkReachable"];

    v58 = [v4 activePictureInPictureURL];
    v59 = [v58 absoluteString];

    if (v59)
    {
      v60 = [v4 activePictureInPictureURL];
      v61 = [v60 absoluteString];
      [v5 setObject:v61 forKey:@"activePictureInPictureURL"];
    }
    v62 = [v4 feedConfiguration];

    if (v62)
    {
      v63 = [v4 feedConfiguration];
      v64 = [v63 selectors];

      if (v64)
      {
        v65 = [v4 feedConfiguration];
        v66 = [v65 selectors];
        v67 = [v66 allObjects];
        [v5 setObject:v67 forKey:@"selectors"];
      }
      v68 = [v4 feedConfiguration];
      v69 = [v68 configuration];

      if (v69)
      {
        v70 = [v4 feedConfiguration];
        v71 = [v70 configuration];
        [v5 setObject:v71 forKey:@"feed"];
      }
    }
    v72 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "is24HourTime"));
    [v5 setObject:v72 forKey:@"is24HourTime"];

    v73 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isTransitioning"));
    [v5 setObject:v73 forKey:@"isTransitioning"];

    v74 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "supportsLiveActivities"));
    [v5 setObject:v74 forKey:@"supportsLiveActivities"];

    uint64_t v82 = 0;
    v75 = [MEMORY[0x263F08900] dataWithJSONObject:v5 options:0 error:&v82];
    if (v75) {
      v76 = (void *)[[NSString alloc] initWithData:v75 encoding:4];
    }
    else {
      v76 = 0;
    }
  }
  else
  {
    v5 = 0;
    v76 = 0;
  }

  return v76;
}

void __62__SWConfigurationSerializer_serializeWebContentConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 absoluteString];
  [v4 setObject:v6 forKey:v5];
}

- (id)serializedRectFromCGRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  v13[4] = *MEMORY[0x263EF8340];
  v12[0] = @"x";
  id v6 = [NSNumber numberWithDouble:a3.origin.x];
  v13[0] = v6;
  v12[1] = @"y";
  v7 = [NSNumber numberWithDouble:y];
  v13[1] = v7;
  v12[2] = @"width";
  v8 = [NSNumber numberWithDouble:width];
  v13[2] = v8;
  v12[3] = @"height";
  v9 = [NSNumber numberWithDouble:height];
  v13[3] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];

  return v10;
}

- (BOOL)isNetworkReachableForStatus:(int64_t)a3
{
  return (a3 & 3) != 0;
}

@end