@interface GainMapPlist
- (GainMapPlist)initWithParams:(id)a3;
- (int)readPlist:(id)a3;
- (int)readPlist:(id)a3 into:(id *)a4;
@end

@implementation GainMapPlist

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"MinThreshold", 0, 0.0);
    self->minThreshold = v6;
    objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"MaxThreshold", 0, 0.0);
    self->maxThreshold = v7;
    LODWORD(v8) = 1.0;
    objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"EstGainScaling", 0, v8);
    self->estGainScaling = v9;
  }
  else
  {
    FigDebugAssert3();
  }

  return 0;
}

- (int)readPlist:(id)a3 into:(id *)a4
{
  id v5 = a3;
  float v7 = v5;
  if (v5 && a4)
  {
    LODWORD(v6) = 11.0;
    objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"DLuxX1", 0, v6);
    a4->var0 = v8;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DLuxY1", 0, 0.0);
    a4->var1 = v9;
    LODWORD(v10) = 15.0;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DLuxX2", 0, v10);
    a4->var2 = v11;
    LODWORD(v12) = 0.5;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DLuxY2", 0, v12);
    a4->var3 = v13;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DSoftX1", 0, 0.0);
    a4->var4 = v14;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DSoftY1", 0, 0.0);
    a4->var5 = v15;
    LODWORD(v16) = 4.0;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DSoftX2", 0, v16);
    a4->var6 = v17;
    LODWORD(v18) = 1.0;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DSoftY2", 0, v18);
    a4->var7 = v19;
    LODWORD(v20) = 2.0;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DLowX1", 0, v20);
    a4->var8 = v21;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DLowY1", 0, 0.0);
    a4->var9 = v22;
    LODWORD(v23) = 8.0;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DLowX2", 0, v23);
    a4->var10 = v24;
    LODWORD(v25) = -0.5;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DLowY2", 0, v25);
    a4->var11 = v26;
    LODWORD(v27) = 1.0;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DISOX1", 0, v27);
    a4->var12 = v28;
    LODWORD(v29) = 1045220557;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DISOY1", 0, v29);
    a4->var13 = v30;
    LODWORD(v31) = 4.0;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DISOX2", 0, v31);
    a4->var14 = v32;
    LODWORD(v33) = 1017370378;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DISOY2", 0, v33);
    a4->var15 = v34;
    LODWORD(v35) = 1008981770;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DHistLow", 0, v35);
    a4->var16 = v36;
    LODWORD(v37) = 1059648963;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DHistMid", 0, v37);
    a4->var17 = v38;
    LODWORD(v39) = 1065185444;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DHistHi", 0, v39);
    a4->var18 = v40;
    LODWORD(v41) = 1076258406;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DHistMaxGNorm", 0, v41);
    a4->var19 = v42;
    LODWORD(v43) = 4.0;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DHDRRef", 0, v43);
    a4->var20 = v44;
    LODWORD(v45) = 1060320051;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DHDRMix0", 0, v45);
    a4->var21[0] = v46;
    LODWORD(v47) = 0.5;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DHDRMix1", 0, v47);
    a4->var21[1] = v48;
    LODWORD(v49) = 1038174126;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DHDRMix2", 0, v49);
    a4->var21[2] = v50;
    LODWORD(v51) = 1.0;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DClippedPixelsThresh", 0, v51);
    a4->var22 = v52;
    LODWORD(v53) = 1055780137;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DClippingCompressionStart", 0, v53);
    a4->var23 = v54;
    LODWORD(v55) = 0.5;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DClippingCompressionEnd", 0, v55);
    a4->var24 = v56;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DClipX1", 0, 0.0);
    a4->var25 = v57;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DClipY1", 0, 0.0);
    a4->var26 = v58;
    LODWORD(v59) = 1053609165;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DClipX2", 0, v59);
    a4->var27 = v60;
    LODWORD(v61) = 1.0;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DClipY2", 0, v61);
    a4->var28 = v62;
    LODWORD(v63) = 1059648963;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DClipPower", 0, v63);
    a4->var29 = v64;
    LODWORD(v65) = 3.0;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"BaseEDR", 0, v65);
    a4->var30 = v66;
    LODWORD(v67) = 1050253722;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"HDRMixMaxY1", 0, v67);
    a4->var31 = v68;
    LODWORD(v69) = 0.5;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"HDRMixMaxY2", 0, v69);
    a4->var32 = v70;
    LODWORD(v71) = 1061997773;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"HDRMixMaxX1", 0, v71);
    a4->var33 = v72;
    LODWORD(v73) = 1063675494;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"HDRMixMaxX2", 0, v73);
    a4->var34 = v74;
    LODWORD(v75) = 961656599;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"ShadowVal", 0, v75);
    a4->var35 = v76;
    a4->var36 = objc_msgSend(v7, "cmi_unsignedIntValueForKey:defaultValue:found:", @"HLInd", 40, 0);
    LODWORD(v77) = 1008981770;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"ThrHL", 0, v77);
    a4->var38 = v78;
    LODWORD(v79) = 1075000115;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DWChangeMaxForMidsTop", 0, v79);
    a4->var40 = v80;
    LODWORD(v81) = 1075000115;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DWChangeMaxForMidsTh1", 0, v81);
    a4->var41 = v82;
    LODWORD(v83) = 1070386381;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"DWChangeMaxForMidsTh2", 0, v83);
    a4->var43 = v84;
    LODWORD(v85) = 758115327;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"EPSForLog", 0, v85);
    a4->var44 = v86;
    LODWORD(v87) = -8.0;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"X1DWChangeForMids", 0, v87);
    a4->var45 = v88;
    LODWORD(v89) = -4.0;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"X2DWChangeForMids", 0, v89);
    a4->var46 = v90;
    a4->var37 = objc_msgSend(v7, "cmi_unsignedIntValueForKey:defaultValue:found:", @"HLStartingPoint", 153, 0);
    a4->var39 = objc_msgSend(v7, "cmi_unsignedIntValueForKey:defaultValue:found:", @"HTTopThr1", 32, 0);
    a4->var42 = objc_msgSend(v7, "cmi_unsignedIntValueForKey:defaultValue:found:", @"HTTopThr2", 16, 0);
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"ExposureBiasFactor", 0, 0.0);
    a4->var47 = v91;
    LODWORD(v92) = 1.0;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"FullContrastBoost", 0, v92);
    a4->var48 = v93;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"HTUseContrast", 0, 0.0);
    a4->var49 = v94;
    LODWORD(v95) = 1.0;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"GammaBoost", 0, v95);
    a4->var50 = v96;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"HTUseGamma", 0, 0.0);
    a4->var51 = v97;
    LODWORD(v98) = 1065437102;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", @"LTMChangeHLSThresh", 0, v98);
    a4->var52 = v99;
  }
  else
  {
    FigDebugAssert3();
  }

  return 0;
}

- (GainMapPlist)initWithParams:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4
    || (v30.receiver = self,
        v30.super_class = (Class)GainMapPlist,
        id v5 = [(CMITuningPlist *)&v30 init],
        (self = v5) == 0))
  {
    FigDebugAssert3();
    if (!FigSignalErrorAt()) {
      goto LABEL_8;
    }
LABEL_19:
    float v13 = 0;
    goto LABEL_20;
  }
  v29.receiver = v5;
  v29.super_class = (Class)GainMapPlist;
  [(CMITuningPlist *)&v29 readPlist:v4];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"withoutFaces"];
  if (v6)
  {
    float v7 = (void *)v6;
    float v8 = [v4 objectForKeyedSubscript:@"withFaces"];

    if (v8)
    {
      float v9 = [v4 objectForKeyedSubscript:@"withoutFaces"];
      int v10 = [(GainMapPlist *)self readPlist:v9 into:&self->withoutFaces];

      if (v10) {
        goto LABEL_17;
      }
      float v11 = [v4 objectForKeyedSubscript:@"withFaces"];
      int v12 = [(GainMapPlist *)self readPlist:v11 into:&self->withFaces];

      if (v12) {
        goto LABEL_17;
      }
      goto LABEL_7;
    }
  }
  float v14 = [v4 objectForKeyedSubscript:@"withoutFaces"];
  if (v14)
  {

LABEL_12:
    double v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
LABEL_18:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_19;
  }
  float v15 = [v4 objectForKeyedSubscript:@"withFaces"];

  if (v15) {
    goto LABEL_12;
  }
  if ([(GainMapPlist *)self readPlist:v4 into:&self->withoutFaces]) {
    goto LABEL_17;
  }
  long long v17 = *(_OWORD *)&self->withoutFaces.dsoft_x1;
  *(_OWORD *)&self->withFaces.dlux_x1 = *(_OWORD *)&self->withoutFaces.dlux_x1;
  *(_OWORD *)&self->withFaces.dsoft_x1 = v17;
  long long v18 = *(_OWORD *)&self->withoutFaces.hdr_ref;
  long long v20 = *(_OWORD *)&self->withoutFaces.dlow_x1;
  long long v19 = *(_OWORD *)&self->withoutFaces.diso_x1;
  *(_OWORD *)&self->withFaces.dhist_low = *(_OWORD *)&self->withoutFaces.dhist_low;
  *(_OWORD *)&self->withFaces.hdr_ref = v18;
  *(_OWORD *)&self->withFaces.dlow_x1 = v20;
  *(_OWORD *)&self->withFaces.diso_x1 = v19;
  long long v21 = *(_OWORD *)&self->withoutFaces.hdr_mix_max_x2;
  long long v23 = *(_OWORD *)&self->withoutFaces.clipped_pixels_thresh;
  long long v22 = *(_OWORD *)&self->withoutFaces.dclip_y1;
  *(_OWORD *)&self->withFaces.base_EDR = *(_OWORD *)&self->withoutFaces.base_EDR;
  *(_OWORD *)&self->withFaces.hdr_mix_max_x2 = v21;
  *(_OWORD *)&self->withFaces.clipped_pixels_thresh = v23;
  *(_OWORD *)&self->withFaces.dclip_y1 = v22;
  long long v25 = *(_OWORD *)&self->withoutFaces.ht_top_thr2;
  long long v24 = *(_OWORD *)&self->withoutFaces.x2_dw_change_for_mids;
  long long v26 = *(_OWORD *)&self->withoutFaces.thr_HL;
  *(_OWORD *)&self->withFaces.ht_use_contrast = *(_OWORD *)&self->withoutFaces.ht_use_contrast;
  *(_OWORD *)&self->withFaces.ht_top_thr2 = v25;
  *(_OWORD *)&self->withFaces.x2_dw_change_for_mids = v24;
  *(_OWORD *)&self->withFaces.thr_HL = v26;
LABEL_7:
  if ([(GainMapPlist *)self readPlist:v4])
  {
LABEL_17:
    FigDebugAssert3();
    double v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    goto LABEL_18;
  }
LABEL_8:
  float v13 = self;
LABEL_20:
  double v27 = v13;

  return v27;
}

@end