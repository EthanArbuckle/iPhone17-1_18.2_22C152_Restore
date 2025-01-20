@interface VATKeywordSpotterResult
- (BOOL)_isNbestEntry;
- (NSString)keyword;
- (NSString)secondPassResult;
- (NSURL)audioFileURL;
- (VATKeywordSpotterResult)initWithKeyword:(id)a3 cost:(float)a4 threshold:(float)a5 start:(int)a6 end:(int)a7 duration:(int)a8;
- (double)audioDuration;
- (double)secondPassDuration;
- (float)cost;
- (float)threshold;
- (id)description;
- (id)toJSON;
- (int)audioEnd;
- (int)audioStart;
- (int)duration;
- (int)end;
- (int)start;
- (void)setAudioDuration:(double)a3;
- (void)setAudioEnd:(int)a3;
- (void)setAudioFileURL:(id)a3;
- (void)setAudioStart:(int)a3;
- (void)setCost:(float)a3;
- (void)setDuration:(int)a3;
- (void)setEnd:(int)a3;
- (void)setKeyword:(id)a3;
- (void)setSecondPassDuration:(double)a3;
- (void)setSecondPassResult:(id)a3;
- (void)setStart:(int)a3;
- (void)setThreshold:(float)a3;
- (void)set_isNbestEntry:(BOOL)a3;
@end

@implementation VATKeywordSpotterResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioFileURL, 0);
  objc_storeStrong((id *)&self->_secondPassResult, 0);
  objc_storeStrong((id *)&self->_keywordText, 0);
}

- (void)set_isNbestEntry:(BOOL)a3
{
  self->__isNbestEntry = a3;
}

- (BOOL)_isNbestEntry
{
  return self->__isNbestEntry;
}

- (void)setAudioFileURL:(id)a3
{
}

- (NSURL)audioFileURL
{
  return self->_audioFileURL;
}

- (void)setSecondPassDuration:(double)a3
{
  self->_secondPassDuration = a3;
}

- (double)secondPassDuration
{
  return self->_secondPassDuration;
}

- (void)setSecondPassResult:(id)a3
{
}

- (NSString)secondPassResult
{
  return self->_secondPassResult;
}

- (void)setAudioDuration:(double)a3
{
  self->_audioDuration = a3;
}

- (double)audioDuration
{
  return self->_audioDuration;
}

- (void)setAudioEnd:(int)a3
{
  self->_audioEnd = a3;
}

- (int)audioEnd
{
  return self->_audioEnd;
}

- (void)setAudioStart:(int)a3
{
  self->_audioStart = a3;
}

- (int)audioStart
{
  return self->_audioStart;
}

- (void)setDuration:(int)a3
{
  self->_duration = a3;
}

- (int)duration
{
  return self->_duration;
}

- (void)setEnd:(int)a3
{
  self->_end = a3;
}

- (int)end
{
  return self->_end;
}

- (void)setStart:(int)a3
{
  self->_start = a3;
}

- (int)start
{
  return self->_start;
}

- (void)setCost:(float)a3
{
  self->_cost = a3;
}

- (float)cost
{
  return self->_cost;
}

- (void)setThreshold:(float)a3
{
  self->_threshold = a3;
}

- (float)threshold
{
  return self->_threshold;
}

- (id)description
{
  return (id)MEMORY[0x270F9A6D0](self, sel_toJSON);
}

- (void)setKeyword:(id)a3
{
}

- (NSString)keyword
{
  return self->_keywordText;
}

- (id)toJSON
{
  v34[6] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF9A0];
  v34[0] = self->_keywordText;
  v33[0] = @"keyword";
  v33[1] = @"threshold";
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%5.3f", self->_threshold);
  v34[1] = v4;
  v33[2] = @"cost";
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%5.3f", self->_cost);
  v34[2] = v5;
  v33[3] = @"start";
  v6 = [NSNumber numberWithInt:self->_start];
  v34[3] = v6;
  v33[4] = @"end";
  v7 = [NSNumber numberWithInt:self->_end];
  v34[4] = v7;
  v33[5] = @"duration";
  v8 = [NSNumber numberWithInt:self->_duration];
  v34[5] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:6];
  v10 = [v3 dictionaryWithDictionary:v9];

  if (!self->__isNbestEntry)
  {
    if (self->_audioFileURL)
    {
      v31[0] = @"audioStart";
      v11 = [NSNumber numberWithInt:self->_audioStart];
      v32[0] = v11;
      v31[1] = @"audioEnd";
      v12 = [NSNumber numberWithInt:self->_audioEnd];
      v32[1] = v12;
      v31[2] = @"audioDuration";
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"%5.3f", *(void *)&self->_audioDuration);
      v32[2] = v13;
      v31[3] = @"audioFileURL";
      audioFileURL = self->_audioFileURL;
      if (audioFileURL)
      {
        v15 = [(NSURL *)self->_audioFileURL path];
      }
      else
      {
        v15 = &stru_270D59F58;
      }
      v32[3] = v15;
      v16 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:4];
      if (audioFileURL) {

      }
      [v10 addEntriesFromDictionary:v16];
    }
    double secondPassDuration = self->_secondPassDuration;
    if (secondPassDuration > 0.0)
    {
      if (self->_secondPassResult) {
        secondPassResult = (__CFString *)self->_secondPassResult;
      }
      else {
        secondPassResult = @"<nil>";
      }
      v29[0] = @"secondPassResult";
      v29[1] = @"secondPassDuration";
      v30[0] = secondPassResult;
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"%5.3f", *(void *)&secondPassDuration);
      v30[1] = v19;
      v20 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];

      [v10 addEntriesFromDictionary:v20];
    }
  }
  id v26 = 0;
  v21 = [MEMORY[0x263F08900] dataWithJSONObject:v10 options:11 error:&v26];
  id v22 = v26;
  if (v21)
  {
    v23 = (void *)[[NSString alloc] initWithData:v21 encoding:4];
  }
  else
  {
    v24 = _VATLoggingFacility(kVATLogCategoryFramework);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v22;
      _os_log_error_impl(&dword_2613B8000, v24, OS_LOG_TYPE_ERROR, "Error serializing VATKeywordSpotterResult: %@", buf, 0xCu);
    }

    v23 = 0;
  }

  return v23;
}

- (VATKeywordSpotterResult)initWithKeyword:(id)a3 cost:(float)a4 threshold:(float)a5 start:(int)a6 end:(int)a7 duration:(int)a8
{
  id v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VATKeywordSpotterResult;
  v16 = [(VATKeywordSpotterResult *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_keywordText, a3);
    v17->_threshold = a5;
    v17->_cost = a4;
    v17->_start = a6;
    v17->_end = a7;
    v17->_duration = a8;
  }

  return v17;
}

@end