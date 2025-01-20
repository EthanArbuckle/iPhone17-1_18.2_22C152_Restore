@interface VisionCoreVideoSegmentationInferenceNetworkDescriptor
+ (id)_configurationForIdentifer:(id)a3 version:(id)a4;
+ (id)descriptorForIdentifier:(id)a3 version:(id)a4 error:(id *)a5;
+ (id)supportedIdentifersForVersion:(id)a3;
- (BOOL)postProcessRegularFrameForInferenceOutputMattingBuffer:(id)a3 postProcessingOutputMaskImageBuffer:(__CVBuffer *)a4 postProcessingOutputMaskImageOrientation:(unsigned int)a5 error:(id *)a6;
- (BOOL)postProcessUpdateFrameForInferenceOutputKey:(id)a3 inferenceOutputValue:(id)a4 inferenceOutputMatting:(id)a5 postProcessingOutputKey:(id)a6 postProcessingOutputValue:(id)a7 postProcessingOutputMaskImageBuffer:(__CVBuffer *)a8 postProcessingOutputMaskOrientation:(unsigned int)a9 error:(id *)a10;
- (BOOL)postProcessUpdateFrameForInferenceOutputKey:(id)a3 inferenceOutputValue:(id)a4 postProcessingOutputKey:(id)a5 postProcessingOutputValue:(id)a6 error:(id *)a7;
- (BOOL)requiresPostProcessing;
@end

@implementation VisionCoreVideoSegmentationInferenceNetworkDescriptor

- (BOOL)postProcessUpdateFrameForInferenceOutputKey:(id)a3 inferenceOutputValue:(id)a4 postProcessingOutputKey:(id)a5 postProcessingOutputValue:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = [(VisionCoreProcessingDescriptor *)self identifier];
  if ([v16 isEqualToString:@"VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier512x384"])goto LABEL_6; {
  id v17 = v14;
  }
  v18 = [(VisionCoreProcessingDescriptor *)self identifier];
  if ([v18 isEqualToString:@"VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier576x320"])
  {
LABEL_5:

    id v14 = v17;
LABEL_6:

    goto LABEL_7;
  }
  v19 = [(VisionCoreProcessingDescriptor *)self identifier];
  if ([v19 isEqualToString:@"VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier320x576"])
  {

    goto LABEL_5;
  }
  [(VisionCoreProcessingDescriptor *)self identifier];
  id v31 = v15;
  v33 = id v32 = v12;
  char v43 = [v33 isEqualToString:@"VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier384x512"];

  id v12 = v32;
  id v15 = v31;

  id v14 = v17;
  if (v43)
  {
LABEL_7:
    v20 = (void *)[(ANSTInferenceDescriptor *)self->super._descriptor newPostprocessorWithError:a7];
    if (v20)
    {
      id v42 = v15;
      v21 = [(ANSTInferenceDescriptor *)self->super._descriptor outputTensorDescriptorNamed:@"key"];
      v22 = [(VisionCoreANSTInferenceNetworkDescriptor *)self _anstTensorDataRepresentation:v21 data:v12 error:a7];
      if (v22
        && ![v20 setInputTensorData:v22 forInferenceOutputDescriptor:v21 withError:a7])
      {
        char v30 = 0;
      }
      else
      {
        uint64_t v23 = [(ANSTInferenceDescriptor *)self->super._descriptor outputTensorDescriptorNamed:@"value"];
        id v24 = v13;
        v25 = (void *)v23;
        v41 = v24;
        v26 = -[VisionCoreANSTInferenceNetworkDescriptor _anstTensorDataRepresentation:data:error:](self, "_anstTensorDataRepresentation:data:error:", v23);
        if (v26
          && ![v20 setInputTensorData:v26 forInferenceOutputDescriptor:v25 withError:a7])
        {
          char v30 = 0;
        }
        else
        {
          id v40 = v12;
          v27 = [(VisionCoreANSTInferenceNetworkDescriptor *)self _outputDescriptorWithName:@"key" postProcessor:v20];
          id v39 = v14;
          v38 = [(VisionCoreANSTInferenceNetworkDescriptor *)self _anstTensorDataRepresentation:v27 data:v14 error:a7];
          int v37 = objc_msgSend(v20, "setOutputTensorData:forProcessedOutputDescriptor:withError:");
          v28 = [(VisionCoreANSTInferenceNetworkDescriptor *)self _outputDescriptorWithName:@"value" postProcessor:v20];
          v29 = [(VisionCoreANSTInferenceNetworkDescriptor *)self _anstTensorDataRepresentation:v28 data:v42 error:a7];
          char v30 = 0;
          if ([v20 setOutputTensorData:v29 forProcessedOutputDescriptor:v28 withError:a7]&& v37)
          {
            char v30 = [v20 processWithError:a7];
          }

          id v14 = v39;
          id v12 = v40;
        }

        id v13 = v41;
      }

      id v15 = v42;
    }
    else
    {
      char v30 = 0;
    }
    goto LABEL_24;
  }
  if (!a7)
  {
    char v30 = 0;
    goto LABEL_25;
  }
  id v34 = [NSString alloc];
  v35 = [(VisionCoreProcessingDescriptor *)self identifier];
  v20 = (void *)[v34 initWithFormat:@"Requires update frame network configuration. %@ was specified", v35];

  id v14 = v17;
  [MEMORY[0x263F087E8] VisionCoreErrorForInvalidOperationWithLocalizedDescription:v20];
  char v30 = 0;
  *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

LABEL_25:
  return v30;
}

- (BOOL)postProcessUpdateFrameForInferenceOutputKey:(id)a3 inferenceOutputValue:(id)a4 inferenceOutputMatting:(id)a5 postProcessingOutputKey:(id)a6 postProcessingOutputValue:(id)a7 postProcessingOutputMaskImageBuffer:(__CVBuffer *)a8 postProcessingOutputMaskOrientation:(unsigned int)a9 error:(id *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v49 = a5;
  id v47 = a6;
  id v46 = a7;
  CVPixelBufferRef texture = a8;
  CVPixelBufferRetain(a8);
  v18 = [(VisionCoreProcessingDescriptor *)self identifier];
  if ([v18 isEqualToString:@"VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier512x384"])goto LABEL_6; {
  v19 = [(VisionCoreProcessingDescriptor *)self identifier];
  }
  if ([v19 isEqualToString:@"VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier576x320"])
  {
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  v20 = [(VisionCoreProcessingDescriptor *)self identifier];
  if ([v20 isEqualToString:@"VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier320x576"])
  {

    goto LABEL_5;
  }
  id v32 = [(VisionCoreProcessingDescriptor *)self identifier];
  char v33 = [v32 isEqualToString:@"VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier384x512"];

  if ((v33 & 1) == 0)
  {
    id v34 = [NSString alloc];
    v35 = [(VisionCoreProcessingDescriptor *)self identifier];
    v36 = (void *)[v34 initWithFormat:@"Requires update frame network configuration. %@ was specified", v35];

    *a10 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidOperationWithLocalizedDescription:v36];

    char v31 = 0;
    goto LABEL_28;
  }
LABEL_7:
  v21 = (void *)[(ANSTInferenceDescriptor *)self->super._descriptor newPostprocessorWithError:a10];
  if (v21)
  {
    id v44 = v17;
    id v45 = v16;
    v22 = [(ANSTInferenceDescriptor *)self->super._descriptor outputTensorDescriptorNamed:@"key"];
    uint64_t v23 = [(VisionCoreANSTInferenceNetworkDescriptor *)self _anstTensorDataRepresentation:v22 data:v16 error:a10];
    if (v23
      && ![v21 setInputTensorData:v23 forInferenceOutputDescriptor:v22 withError:a10])
    {
      char v31 = 0;
    }
    else
    {
      char v43 = [(ANSTInferenceDescriptor *)self->super._descriptor outputTensorDescriptorNamed:@"value"];
      id v24 = [(VisionCoreANSTInferenceNetworkDescriptor *)self _anstTensorDataRepresentation:v43 data:v44 error:a10];
      if (v24
        && ![v21 setInputTensorData:v24 forInferenceOutputDescriptor:v43 withError:a10])
      {
        char v31 = 0;
      }
      else
      {
        id v42 = [(ANSTInferenceDescriptor *)self->super._descriptor outputTensorDescriptorNamed:@"output_matting"];
        v41 = [(VisionCoreANSTInferenceNetworkDescriptor *)self _anstTensorDataRepresentation:v42 data:v49 error:a10];
        if (v41
          && ![v21 setInputTensorData:v41 forInferenceOutputDescriptor:v42 withError:a10])
        {
          char v31 = 0;
        }
        else
        {
          uint64_t v25 = [(VisionCoreANSTInferenceNetworkDescriptor *)self _outputDescriptorWithName:@"output_mask" postProcessor:v21];
          v38 = [(VisionCoreANSTInferenceNetworkDescriptor *)self _anstPixelBufferRepresentation:v25 pixelBufferRepresentation:texture orientation:a9 error:a10];
          id v39 = (void *)v25;
          int v40 = [v21 setOutputPixelBuffer:v38 forProcessedOutputDescriptor:v25 withError:a10];
          v26 = [(VisionCoreANSTInferenceNetworkDescriptor *)self _outputDescriptorWithName:@"key" postProcessor:v21];
          v27 = [(VisionCoreANSTInferenceNetworkDescriptor *)self _anstTensorDataRepresentation:v26 data:v47 error:a10];
          int v28 = [v21 setOutputTensorData:v27 forProcessedOutputDescriptor:v26 withError:a10];
          v29 = [(VisionCoreANSTInferenceNetworkDescriptor *)self _outputDescriptorWithName:@"value" postProcessor:v21];
          char v30 = [(VisionCoreANSTInferenceNetworkDescriptor *)self _anstTensorDataRepresentation:v29 data:v46 error:a10];
          if (v40 & [v21 setOutputTensorData:v30 forProcessedOutputDescriptor:v29 withError:a10] & v28)char v31 = objc_msgSend(v21, "processWithError:", a10); {
          else
          }
            char v31 = 0;
        }
      }
    }
    id v17 = v44;
    id v16 = v45;
  }
  else
  {
    char v31 = 0;
  }

LABEL_28:
  CVPixelBufferRelease(texture);

  return v31;
}

- (BOOL)postProcessRegularFrameForInferenceOutputMattingBuffer:(id)a3 postProcessingOutputMaskImageBuffer:(__CVBuffer *)a4 postProcessingOutputMaskImageOrientation:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  CVPixelBufferRetain(a4);
  v11 = [(VisionCoreProcessingDescriptor *)self identifier];
  if ([v11 isEqualToString:@"VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier512x384"])goto LABEL_6; {
  id v12 = [(VisionCoreProcessingDescriptor *)self identifier];
  }
  if ([v12 isEqualToString:@"VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier576x320"])
  {
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  id v13 = [(VisionCoreProcessingDescriptor *)self identifier];
  if ([v13 isEqualToString:@"VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier320x576"])
  {

    goto LABEL_5;
  }
  v21 = [(VisionCoreProcessingDescriptor *)self identifier];
  char v22 = [v21 isEqualToString:@"VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier384x512"];

  if ((v22 & 1) == 0)
  {
    id v23 = [NSString alloc];
    id v24 = [(VisionCoreProcessingDescriptor *)self identifier];
    uint64_t v25 = (void *)[v23 initWithFormat:@"Requires regular frame network configuration. %@ was specified", v24];

    *a6 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidOperationWithLocalizedDescription:v25];

    char v19 = 0;
    goto LABEL_18;
  }
LABEL_7:
  id v14 = (void *)[(ANSTInferenceDescriptor *)self->super._descriptor newPostprocessorWithError:a6];
  if (v14)
  {
    id v15 = [(ANSTInferenceDescriptor *)self->super._descriptor outputTensorDescriptorNamed:@"output_matting"];
    id v16 = [(VisionCoreANSTInferenceNetworkDescriptor *)self _anstTensorDataRepresentation:v15 data:v10 error:a6];
    if (v16
      && ![v14 setInputTensorData:v16 forInferenceOutputDescriptor:v15 withError:a6])
    {
      char v19 = 0;
    }
    else
    {
      id v17 = [(VisionCoreANSTInferenceNetworkDescriptor *)self _outputDescriptorWithName:@"output_mask" postProcessor:v14];
      v18 = [(VisionCoreANSTInferenceNetworkDescriptor *)self _anstPixelBufferRepresentation:v17 pixelBufferRepresentation:a4 orientation:v7 error:a6];
      if ([v14 setOutputPixelBuffer:v18 forProcessedOutputDescriptor:v17 withError:a6]) {
        char v19 = [v14 processWithError:a6];
      }
      else {
        char v19 = 0;
      }
    }
  }
  else
  {
    char v19 = 0;
  }

LABEL_18:
  CVPixelBufferRelease(a4);

  return v19;
}

- (BOOL)requiresPostProcessing
{
  v2 = [(VisionCoreProcessingDescriptor *)self specifier];
  v3 = [v2 identifier];

  if (([v3 isEqualToString:@"VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier512x384"] & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", @"VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier576x320") & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", @"VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier384x512") & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", @"VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier320x576") & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", @"VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier512x384") & 1) != 0
    || ([v3 isEqualToString:@"VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier576x320"] & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", @"VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier384x512") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    int v4 = [v3 isEqualToString:@"VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier320x576"] ^ 1;
  }

  return v4;
}

+ (id)supportedIdentifersForVersion:(id)a3
{
  v10[6] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 major] == 1)
  {
    v10[0] = @"VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier512x384";
    v10[1] = @"VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier576x320";
    v10[2] = @"VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier512x384";
    v10[3] = @"VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier576x320";
    v10[4] = @"VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier512x384";
    v10[5] = @"VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier576x320";
    int v4 = (void *)MEMORY[0x263EFF8C0];
    v5 = v10;
    uint64_t v6 = 6;
LABEL_5:
    uint64_t v7 = [v4 arrayWithObjects:v5 count:v6];
    goto LABEL_7;
  }
  if ([v3 major] == 2)
  {
    v9[0] = @"VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier512x384";
    v9[1] = @"VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier576x320";
    v9[2] = @"VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier512x384";
    v9[3] = @"VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier576x320";
    v9[4] = @"VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier512x384";
    v9[5] = @"VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier576x320";
    v9[6] = @"VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier384x512";
    v9[7] = @"VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier320x576";
    v9[8] = @"VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier384x512";
    v9[9] = @"VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier320x576";
    v9[10] = @"VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier384x512";
    v9[11] = @"VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier320x576";
    int v4 = (void *)MEMORY[0x263EFF8C0];
    v5 = v9;
    uint64_t v6 = 12;
    goto LABEL_5;
  }
  uint64_t v7 = (void *)MEMORY[0x263EFFA68];
LABEL_7:

  return v7;
}

+ (id)descriptorForIdentifier:(id)a3 version:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 major] == 1)
  {
    if (a5)
    {
      id v10 = [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableDescriptorIdentifier:v8 version:v9];
LABEL_16:
      v18 = 0;
      *a5 = v10;
      goto LABEL_33;
    }
LABEL_17:
    v18 = 0;
    goto LABEL_33;
  }
  v11 = [a1 supportedIdentifersForVersion:v9];
  char v12 = [v11 containsObject:v8];

  if ((v12 & 1) == 0)
  {
    if (a5)
    {
      id v10 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:@"network identifier not supported by the specified version"];
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  id v13 = +[VisionCoreVideoSegmentationInferenceNetworkDescriptor _configurationForIdentifer:v8 version:v9];
  if (([v8 isEqualToString:@"VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier512x384"] & 1) != 0|| (objc_msgSend(v8, "isEqualToString:", @"VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier576x320") & 1) != 0|| (objc_msgSend(v8, "isEqualToString:", @"VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier384x512") & 1) != 0|| objc_msgSend(v8, "isEqualToString:", @"VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier320x576"))
  {
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x2050000000;
    id v14 = (void *)getANSTViSegHQInitialFrameInferenceDescriptorClass_softClass;
    uint64_t v25 = getANSTViSegHQInitialFrameInferenceDescriptorClass_softClass;
    if (!getANSTViSegHQInitialFrameInferenceDescriptorClass_softClass)
    {
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __getANSTViSegHQInitialFrameInferenceDescriptorClass_block_invoke;
      v21[3] = &unk_26488B4B8;
      v21[4] = &v22;
      __getANSTViSegHQInitialFrameInferenceDescriptorClass_block_invoke((uint64_t)v21);
      id v14 = (void *)v23[3];
    }
    id v15 = v14;
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    if (([v8 isEqualToString:@"VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier512x384"] & 1) != 0|| (objc_msgSend(v8, "isEqualToString:", @"VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier576x320") & 1) != 0|| (objc_msgSend(v8, "isEqualToString:", @"VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier384x512") & 1) != 0|| objc_msgSend(v8, "isEqualToString:", @"VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier320x576"))
    {
      id ANSTViSegHQRegularFrameInferenceDescriptorClass = getANSTViSegHQRegularFrameInferenceDescriptorClass();
    }
    else
    {
      if (([v8 isEqualToString:@"VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier512x384"] & 1) == 0&& (objc_msgSend(v8, "isEqualToString:", @"VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier576x320") & 1) == 0&& (objc_msgSend(v8, "isEqualToString:", @"VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier384x512") & 1) == 0&& !objc_msgSend(v8, "isEqualToString:", @"VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier320x576"))
      {
        goto LABEL_29;
      }
      id ANSTViSegHQRegularFrameInferenceDescriptorClass = getANSTViSegHQUpdateFrameInferenceDescriptorClass();
    }
    id v15 = ANSTViSegHQRegularFrameInferenceDescriptorClass;
  }
  uint64_t v16 = [v15 descriptorWithConfiguration:v13 error:a5];
  if (!v16)
  {
LABEL_29:
    if (a5)
    {
      [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:@"Unrecognized descriptorIdentifier"];
      v18 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    goto LABEL_32;
  }
  id v17 = (void *)v16;
  v18 = [(VisionCoreANSTInferenceNetworkDescriptor *)[VisionCoreVideoSegmentationInferenceNetworkDescriptor alloc] initWithDescriptor:v16 identifer:v8];

LABEL_32:
LABEL_33:

  return v18;
}

+ (id)_configurationForIdentifer:(id)a3 version:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v6 major];
  int v8 = [v6 major];

  if ((([v5 isEqualToString:@"VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier512x384"] & 1) != 0|| (objc_msgSend(v5, "isEqualToString:", @"VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier512x384") & 1) != 0|| objc_msgSend(v5, "isEqualToString:", @"VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier512x384"))&& v7 == 1)
  {
    id v9 = objc_alloc((Class)getANSTViSegHQInferenceConfigurationClass());
    uint64_t v10 = 0x10000;
LABEL_17:
    uint64_t v11 = 0;
    goto LABEL_18;
  }
  if ((([v5 isEqualToString:@"VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier576x320"] & 1) != 0|| (objc_msgSend(v5, "isEqualToString:", @"VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier576x320") & 1) != 0|| objc_msgSend(v5, "isEqualToString:", @"VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier576x320"))&& v7 == 1)
  {
    id v9 = objc_alloc((Class)getANSTViSegHQInferenceConfigurationClass());
    uint64_t v10 = 0x10000;
LABEL_11:
    uint64_t v11 = 1;
LABEL_18:
    char v12 = (void *)[v9 initWithVersion:v10 resolution:v11];
    goto LABEL_19;
  }
  if ((([v5 isEqualToString:@"VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier512x384"] & 1) != 0|| (objc_msgSend(v5, "isEqualToString:", @"VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier512x384") & 1) != 0|| objc_msgSend(v5, "isEqualToString:", @"VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier512x384"))&& v8 == 2)
  {
    id v9 = objc_alloc((Class)getANSTViSegHQInferenceConfigurationClass());
    uint64_t v10 = 0x20000;
    goto LABEL_17;
  }
  if ((([v5 isEqualToString:@"VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier576x320"] & 1) != 0|| (objc_msgSend(v5, "isEqualToString:", @"VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier576x320") & 1) != 0|| objc_msgSend(v5, "isEqualToString:", @"VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier576x320"))&& v8 == 2)
  {
    id v9 = objc_alloc((Class)getANSTViSegHQInferenceConfigurationClass());
    uint64_t v10 = 0x20000;
    goto LABEL_11;
  }
  if ((([v5 isEqualToString:@"VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier384x512"] & 1) != 0|| (objc_msgSend(v5, "isEqualToString:", @"VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier384x512") & 1) != 0|| objc_msgSend(v5, "isEqualToString:", @"VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier384x512"))&& v8 == 2)
  {
    id v9 = objc_alloc((Class)getANSTViSegHQInferenceConfigurationClass());
    uint64_t v10 = 0x20000;
    uint64_t v11 = 2;
    goto LABEL_18;
  }
  if ([v5 isEqualToString:@"VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier320x576"] & 1) != 0|| (objc_msgSend(v5, "isEqualToString:", @"VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier320x576"))
  {
    if (v8 != 2)
    {
      char v12 = 0;
      goto LABEL_19;
    }
LABEL_38:
    id v9 = objc_alloc((Class)getANSTViSegHQInferenceConfigurationClass());
    uint64_t v10 = 0x20000;
    uint64_t v11 = 3;
    goto LABEL_18;
  }
  char v12 = 0;
  if ([v5 isEqualToString:@"VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier320x576"]&& v8 == 2)
  {
    goto LABEL_38;
  }
LABEL_19:

  return v12;
}

@end