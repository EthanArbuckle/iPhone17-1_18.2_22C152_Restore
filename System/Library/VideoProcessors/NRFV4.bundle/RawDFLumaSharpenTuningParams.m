@interface RawDFLumaSharpenTuningParams
- (BOOL)isEnabled;
- (RawDFLumaSharpenTuningParams)init;
- (int)config:(id *)a3 withFrameProperties:(id)a4 frameType:(int)a5;
- (int)readPlist:(id)a3;
- (int)readPlist:(id)a3 forFrame:(id)a4;
- (void)setIsEnabled:(BOOL)a3;
@end

@implementation RawDFLumaSharpenTuningParams

- (int)readPlist:(id)a3 forFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:v7];
  if ([v7 isEqual:@"EVZero"])
  {
    uint64_t v9 = 84;
  }
  else if ([v7 isEqual:@"EVMinus"])
  {
    uint64_t v9 = 8;
  }
  else if ([v7 isEqual:@"Long"])
  {
    uint64_t v9 = 160;
  }
  else
  {
    if (([v7 isEqual:@"Quadra48_EVZero"] & 1) == 0)
    {
      v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      int v10 = -73320;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v14 = 0;
      goto LABEL_54;
    }
    uint64_t v9 = 236;
  }
  int v10 = -73320;
  v11 = getNumberForKey(v8, @"DotFixOn");
  v12 = v11;
  if (!v11) {
    goto LABEL_55;
  }
  v13 = (char *)self + v9;
  *((unsigned char *)&self->super.isa + v9 + 4) = [v11 BOOLValue];
  v14 = getNumberForKey(v8, @"LocalSharpClip");

  if (!v14)
  {
LABEL_54:
    v12 = 0;
    goto LABEL_51;
  }
  v13[5] = [v14 BOOLValue];
  v12 = [v8 valueForKey:@"SharpeningControl"];
  if (!v12) {
    goto LABEL_51;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ([v12 count])
    {
      int v10 = FigSignalErrorAt();
      goto LABEL_51;
    }
    if ([v7 isEqual:@"EVZero"])
    {
      v16 = (NSArray *)[v12 copy];
      strengthEVZero = self->_strengthEVZero;
      self->_strengthEVZero = v16;
    }
    else if ([v7 isEqual:@"EVMinus"])
    {
      v19 = (NSArray *)[v12 copy];
      strengthEVZero = self->_strengthEVMinus;
      self->_strengthEVMinus = v19;
    }
    else if ([v7 isEqual:@"Long"])
    {
      v21 = (NSArray *)[v12 copy];
      strengthEVZero = self->_strengthLong;
      self->_strengthLong = v21;
    }
    else
    {
      if (![v7 isEqual:@"Quadra48_EVZero"]) {
        goto LABEL_52;
      }
      v24 = (NSArray *)[v12 copy];
      strengthEVZero = self->_strengthQuadra48EVZero;
      self->_strengthQuadra48EVZero = v24;
    }

    goto LABEL_32;
  }
  if (![v7 isEqual:@"EVZero"])
  {
    if ([v7 isEqual:@"EVMinus"])
    {
      [v12 floatValue];
      self->_strengthEVMinusNumber = v18;
      goto LABEL_32;
    }
    if ([v7 isEqual:@"Long"])
    {
      [v12 floatValue];
      self->_strengthLongNumber = v20;
      goto LABEL_32;
    }
    if ([v7 isEqual:@"Quadra48_EVZero"])
    {
      [v12 floatValue];
      self->_strengthQuadra48EVZeroNumber = v23;
      goto LABEL_32;
    }
LABEL_52:
    v53 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_51;
  }
  [v12 floatValue];
  self->_strengthEVZeroNumber = v15;
LABEL_32:
  v25 = getNumberForKey(v8, @"DotDetectThreshold");

  if (!v25) {
    goto LABEL_55;
  }
  [v25 floatValue];
  _S0 = v26 / 65535.0;
  __asm { FCVT            H0, S0 }
  *((_WORD *)v13 + 3) = LOWORD(_S0);
  v14 = getNumberForKey(v8, @"PhiSlope");

  if (!v14) {
    goto LABEL_51;
  }
  [v14 floatValue];
  __asm { FCVT            H0, S0 }
  *((_WORD *)v13 + 5) = _S0;
  v33 = getNumberForKey(v8, @"PhiKnee");

  if (!v33) {
    goto LABEL_55;
  }
  [v33 floatValue];
  __asm { FCVT            H0, S0 }
  *((_WORD *)v13 + 6) = _S0;
  v14 = getNumberForKey(v8, @"SharpScaling");

  if (!v14) {
    goto LABEL_51;
  }
  [v14 floatValue];
  __asm { FCVT            H0, S0 }
  *((_WORD *)v13 + 7) = _S0;
  v36 = getNumberForKey(v8, @"OvershootMitigation");

  if (!v36) {
    goto LABEL_55;
  }
  [v36 floatValue];
  __asm { FCVT            H0, S0 }
  *((_WORD *)v13 + 8) = _S0;
  v14 = getNumberForKey(v8, @"ModulationLow");

  if (!v14) {
    goto LABEL_51;
  }
  [v14 floatValue];
  __asm { FCVT            H0, S0 }
  *((_WORD *)v13 + 9) = _S0;
  v39 = getNumberForKey(v8, @"ModulationHigh");

  if (!v39)
  {
LABEL_55:
    v14 = 0;
    goto LABEL_51;
  }
  [v39 floatValue];
  __asm { FCVT            H0, S0 }
  *((_WORD *)v13 + 10) = _S0;
  v14 = getNumberForKey(v8, @"ModulationSlope");

  if (v14)
  {
    [v14 floatValue];
    __asm { FCVT            H0, S0 }
    *((_WORD *)v13 + 11) = _S0;
    v42 = [v8 objectForKey:@"Kernel"];
    v43 = v42;
    if (v42)
    {
      if ([v42 count] != 25)
      {
        v54 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        goto LABEL_50;
      }
      for (uint64_t i = 0; i != 25; ++i)
      {
        v45 = [v43 objectAtIndex:i];
        [v45 floatValue];
        __asm { FCVT            H0, S0 }
        *(_WORD *)&v13[2 * i + 24] = _S0;
      }
    }
    else
    {
      uint64_t v47 = 0;
      v48 = &self->_anon_8[v9 + 16];
      v49 = &readPlist_forFrame___sharpeningKernel;
      do
      {
        for (uint64_t j = 0; j != 5; ++j)
        {
          _S0 = v49[j];
          __asm { FCVT            H0, S0 }
          *(_WORD *)&v48[2 * j] = _S0;
        }
        ++v47;
        v49 += 5;
        v48 += 10;
      }
      while (v47 != 5);
    }
    int v10 = 0;
LABEL_50:
  }
LABEL_51:

  return v10;
}

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_16;
  }
  uint64_t v6 = [v4 objectForKeyedSubscript:@"EVMinus"];
  if (!v6) {
    goto LABEL_16;
  }
  id v7 = (void *)v6;
  uint64_t v8 = [v5 objectForKeyedSubscript:@"Long"];
  if (!v8)
  {

    goto LABEL_16;
  }
  uint64_t v9 = (void *)v8;
  int v10 = [v5 objectForKeyedSubscript:@"EVZero"];

  if (!v10)
  {
LABEL_16:
    v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
LABEL_21:
    int v15 = -73320;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_22;
  }
  v11 = [v5 objectForKey:@"Enabled"];

  if (v11)
  {
    v12 = getNumberForKey(v5, @"Enabled");
    if (!v12)
    {
      int v15 = -73320;
      goto LABEL_22;
    }
    v13 = v12;
    self->_isEnabled = [v12 BOOLValue];
  }
  if ([(RawDFLumaSharpenTuningParams *)self readPlist:v5 forFrame:@"EVMinus"]
    || [(RawDFLumaSharpenTuningParams *)self readPlist:v5 forFrame:@"EVZero"]
    || [(RawDFLumaSharpenTuningParams *)self readPlist:v5 forFrame:@"Long"]
    || ([v5 objectForKey:@"Quadra48_EVZero"],
        v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        v14)
    && [(RawDFLumaSharpenTuningParams *)self readPlist:v5 forFrame:@"Quadra48_EVZero"])
  {
    FigDebugAssert3();
    v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    goto LABEL_21;
  }
  int v15 = 0;
LABEL_22:

  return v15;
}

- (RawDFLumaSharpenTuningParams)init
{
  v3.receiver = self;
  v3.super_class = (Class)RawDFLumaSharpenTuningParams;
  result = [(RawDFLumaSharpenTuningParams *)&v3 init];
  if (result) {
    result->_isEnabled = 1;
  }
  return result;
}

- (int)config:(id *)a3 withFrameProperties:(id)a4 frameType:(int)a5
{
  id v8 = a4;
  uint64_t v9 = v8;
  switch(a5)
  {
    case 0:
      *a3 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)self->_anon_54;
      strengthEVZero = self->_strengthEVZero;
      if (strengthEVZero) {
        goto LABEL_10;
      }
      _S0 = self->_strengthEVZeroNumber;
      __asm { FCVT            H0, S0 }
      *(_WORD *)&self->_anon_54[8] = LOWORD(_S0);
      goto LABEL_11;
    case 1:
      *a3 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)self->_anon_8;
      strengthEVZero = self->_strengthEVMinus;
      if (strengthEVZero) {
        goto LABEL_10;
      }
      _S0 = self->_strengthEVMinusNumber;
      __asm { FCVT            H0, S0 }
      *(_WORD *)&self->_anon_8[8] = LOWORD(_S0);
      goto LABEL_11;
    case 2:
      *a3 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)self->_anon_a0;
      strengthEVZero = self->_strengthLong;
      if (strengthEVZero) {
        goto LABEL_10;
      }
      _S0 = self->_strengthLongNumber;
      __asm { FCVT            H0, S0 }
      *(_WORD *)&self->_anon_a0[8] = LOWORD(_S0);
      goto LABEL_11;
    case 3:
      *a3 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)self->_anon_ec;
      strengthEVZero = self->_strengthQuadra48EVZero;
      if (strengthEVZero)
      {
LABEL_10:
        v19 = [v8 meta];
        LODWORD(v20) = *(_DWORD *)[v19 exposureParams];
        [(NSArray *)strengthEVZero cmi_interpolateValueForGain:v20];
        __asm { FCVT            H0, S0 }
        *((_WORD *)*a3 + 4) = _S0;
      }
      else
      {
        _S0 = self->_strengthQuadra48EVZeroNumber;
        __asm { FCVT            H0, S0 }
        *(_WORD *)&self->_anon_ec[8] = LOWORD(_S0);
      }
LABEL_11:
      int v23 = 0;
      *((short float *)*a3 + 4) = *((short float *)*a3 + 4) * COERCE_SHORT_FLOAT(0x2000);
      break;
    default:
      v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      int v23 = -73320;
      break;
  }

  return v23;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strengthQuadra48EVZero, 0);
  objc_storeStrong((id *)&self->_strengthLong, 0);
  objc_storeStrong((id *)&self->_strengthEVZero, 0);

  objc_storeStrong((id *)&self->_strengthEVMinus, 0);
}

@end