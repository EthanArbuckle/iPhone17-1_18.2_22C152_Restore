@interface H13FastPowerBlurConfig
- (H13FastPowerBlurConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 outputPixelFormat:(unsigned int)a5;
- (float)_calculateReadNoise:(id *)a3;
- (int)getPowerBlurConfigForInputFrame:(id)a3 PowerBlurConfig:(id *)a4 enablePowerBlur:(BOOL *)a5;
@end

@implementation H13FastPowerBlurConfig

- (H13FastPowerBlurConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 outputPixelFormat:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8 || !v9 || !v5) {
    goto LABEL_11;
  }
  v14.receiver = self;
  v14.super_class = (Class)H13FastPowerBlurConfig;
  self = [(SoftISPConfig *)&v14 initWithStaticParameters:v8];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_6;
  }
  -[SoftISPConfig setMaximumOutputDimensions:](self, "setMaximumOutputDimensions:", [v10 maximumWidth] | ((unint64_t)objc_msgSend(v10, "maximumHeight") << 32));
  [(SoftISPConfig *)self setInputPixelFormat:0];
  [(SoftISPConfig *)self setInputMTLPixelFormatForPlane:MEMORY[0x263EFFA68]];
  [(SoftISPConfig *)self setOutputPixelFormat:v5];
  v11 = determineMTLPixelFormatsForCVPixelFormat([(SoftISPConfig *)self outputPixelFormat]);
  [(SoftISPConfig *)self setOutputMTLPixelFormatForPlane:v11];

  v12 = [(SoftISPConfig *)self outputMTLPixelFormatForPlane];

  if (!v12)
  {
LABEL_11:
    FigDebugAssert3();

    self = 0;
  }
LABEL_6:

  return self;
}

- (float)_calculateReadNoise:(id *)a3
{
  float v3 = a3->var0 * a3->var0;
  float v4 = sqrtf((float)(v3 - (float)(a3->var1 * a3->var1)) / 0.98438);
  float v5 = sqrtf(v3 - (float)(v4 * v4));
  return a3->var2 * sqrtf((float)((float)(v4 / a3->var2) * (float)(v4 / a3->var2)) + (float)(v5 * v5));
}

- (int)getPowerBlurConfigForInputFrame:(id)a3 PowerBlurConfig:(id *)a4 enablePowerBlur:(BOOL *)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = -[SoftISPInputFrame metadata]((uint64_t)v8);
  v10 = [(SoftISPConfig *)self staticParameters];
  v11 = [v10 tuningParametersForInputFrameMetadata:v9 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v8)];

  v12 = [v11 valueForKey:@"PowerBlur"];
  v13 = v12;
  char v43 = 0;
  if (v12)
  {
    *a5 = objc_msgSend(v12, "cmi_BOOLValueForKey:defaultValue:found:", @"Enabled", 0, &v43);
    objc_super v14 = -[SoftISPInputFrame processingOptions]((uint64_t)v8);
    *a5 = objc_msgSend(v14, "cmi_BOOLValueForKey:defaultValue:found:", @"CPB", *a5, 0);

    if (*a5)
    {
      a4->int var0 = 2;
      *(void *)&a4->var1 = 0x44E100003A83126FLL;
      objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F700], &v43, 6.42241994e23);
      a4[1].var3.var3 = v15 * 0.0039062;
      LODWORD(v16) = 1.0;
      objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F6F0], &v43, v16);
      a4[1].var3.var4 = v17;
      uint64_t v18 = *MEMORY[0x263F2F2C0];
      LODWORD(v19) = 1132462080;
      objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2C0], &v43, v19);
      v42[2] = v20 * 0.0039062;
      objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F608], &v43, 0.0);
      v42[0] = v21 * 0.000015259;
      objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F610], &v43, 0.0);
      v42[1] = v22 * 0.000015259;
      LODWORD(v23) = 1132462080;
      objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2E0], &v43, v23);
      LODWORD(a4->var3.var3) = *(void *)&a4->var3.var3;
      *(float *)&uint64_t v25 = v24 * 0.00024414;
      HIDWORD(v25) = 1.0;
      *(void *)&a4->var3.var1 = v25;
      LODWORD(v26) = 1132462080;
      objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2D0], &v43, v26);
      a4->var3.var3 = v27 * 0.00024414;
      LODWORD(v28) = 1132462080;
      objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", v18, &v43, v28);
      a4->var4 = v29 * 0.0039062;
      [(H13FastPowerBlurConfig *)self _calculateReadNoise:v42];
      a4->var5 = v30;
      objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F408], &v43, 0.0);
      *(float *)&a4[1].int var0 = v31 * 0.000015259;
      a4[1].var1 = (float)(int)-[SoftISPInputFrame averageSensorBlackLevel]((uint64_t)v8);
      LODWORD(v32) = 1.0;
      objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F538], &v43, v32);
      a4[1].var2 = v33;
      unsigned __int16 v34 = objc_msgSend(v13, "cmi_unsignedIntValueForKey:defaultValue:found:", @"Radius", a4->var0, &v43);
      a4->int var0 = v34;
      if (v43)
      {
        int var0 = v34;
      }
      else
      {
        FigSignalErrorAt();
        int var0 = a4->var0;
      }
      if ((var0 - 7) <= 0xFFFFFFF9)
      {
        v41 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        int v39 = -1;
        goto LABEL_12;
      }
      *(float *)&double v35 = a4->var1;
      objc_msgSend(v13, "cmi_floatValueForKey:defaultValue:found:", @"ColorMatchThreshold", &v43, v35);
      a4->var1 = *(float *)&v37;
      if (!v43) {
        FigSignalErrorAt();
      }
      *(float *)&double v37 = a4->var2;
      objc_msgSend(v13, "cmi_floatValueForKey:defaultValue:found:", @"HighFrequencyNoiseThreshold", &v43, v37);
      a4->var2 = v38;
      if (!v43) {
        FigSignalErrorAt();
      }
    }
  }
  int v39 = 0;
LABEL_12:

  return v39;
}

@end