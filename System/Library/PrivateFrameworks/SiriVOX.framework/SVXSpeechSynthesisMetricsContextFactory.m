@interface SVXSpeechSynthesisMetricsContextFactory
- (double)timeSecondScale;
- (id)creationContextFromInstrumentMetrics:(id)a3;
@end

@implementation SVXSpeechSynthesisMetricsContextFactory

- (double)timeSecondScale
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v3) = info.denom;
  LODWORD(v2) = info.numer;
  return (double)v2 / (double)v3 / 1000000000.0;
}

- (id)creationContextFromInstrumentMetrics:(id)a3
{
  v43[15] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 sourceOfTTS];
  uint64_t v6 = v5;
  BOOL v8 = v5 == 3 || v5 == 5;
  [(SVXSpeechSynthesisMetricsContextFactory *)self timeSecondScale];
  double v10 = v9;
  uint64_t v11 = [v4 synthesisEndTime];
  float v12 = v10 * (double)(unint64_t)(v11 - [v4 synthesisBeginTime]);
  uint64_t v13 = [v4 speechBeginTime];
  float v14 = v10 * (double)(unint64_t)(v13 - [v4 requestCreatedTime]);
  v42[0] = @"character_count";
  v15 = NSNumber;
  v41 = [v4 utterance];
  v40 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v41, "length"));
  v43[0] = v40;
  v42[1] = @"voice_asset_key";
  v39 = [v4 voice];
  uint64_t v16 = [v39 assetKey];
  v17 = (void *)v16;
  v18 = &stru_26D1E1D80;
  if (v16) {
    v18 = (__CFString *)v16;
  }
  v43[1] = v18;
  v42[2] = @"is_warm_start";
  v38 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isWarmStart"));
  v43[2] = v38;
  v42[3] = @"is_cache_hit_from_disk";
  v37 = [NSNumber numberWithInt:v6 == 8];
  v43[3] = v37;
  v42[4] = @"is_server_tts";
  v36 = [NSNumber numberWithBool:v8];
  v43[4] = v36;
  v42[5] = @"tts_synthesis_latency";
  *(float *)&double v19 = v12;
  v20 = [NSNumber numberWithFloat:v19];
  v43[5] = v20;
  v42[6] = @"tts_total_latency";
  *(float *)&double v21 = v14;
  v22 = [NSNumber numberWithFloat:v21];
  v43[6] = v22;
  v42[7] = @"audio_queue_latency";
  v23 = NSNumber;
  [v4 audioStartLatency];
  v24 = objc_msgSend(v23, "numberWithDouble:");
  v43[7] = v24;
  v42[8] = @"synthesis_to_speech_time";
  v25 = NSNumber;
  [v4 eagerRequestGapInterval];
  v26 = objc_msgSend(v25, "numberWithDouble:");
  v43[8] = v26;
  v43[9] = &unk_26D1FCAB0;
  v42[9] = @"wait_for_synthesis_to_finish_time";
  v42[10] = @"audio_duration";
  v27 = NSNumber;
  [v4 audioDuration];
  v28 = objc_msgSend(v27, "numberWithDouble:");
  v43[10] = v28;
  v42[11] = @"is_speech_request";
  v29 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isAudibleRequest"));
  v43[11] = v29;
  v43[12] = MEMORY[0x263EFFA80];
  v42[12] = @"is_cache_hit_from_memory";
  v42[13] = @"synthesis_to_speech_time_gap";
  v43[13] = &unk_26D1FCAB0;
  v42[14] = @"audio_start_timestamp_diffs";
  v30 = NSNumber;
  [v4 audioStartLatency];
  double v32 = v31;

  v33 = [v30 numberWithDouble:v32 / v10];
  v43[14] = v33;
  v34 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:15];

  return v34;
}

@end