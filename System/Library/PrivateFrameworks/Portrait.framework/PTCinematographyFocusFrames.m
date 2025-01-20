@interface PTCinematographyFocusFrames
- (NSArray)frames;
- (PTCinematographyFocusFrames)initWithFrames:(id)a3 options:(id)a4;
- (PTCinematographyFocusFramesOptions)options;
- (int64_t)_framesIndex:(unint64_t)a3 earlierBy:(id *)a4;
- (int64_t)startIndexForLinearRackFocusPullToFrameAtIndex:(unint64_t)a3;
- (void)setFrames:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation PTCinematographyFocusFrames

- (PTCinematographyFocusFrames)initWithFrames:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PTCinematographyFocusFrames;
  v9 = [(PTCinematographyFocusFrames *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_frames, a3);
    if (v8) {
      uint64_t v11 = [v8 copy];
    }
    else {
      uint64_t v11 = objc_opt_new();
    }
    options = v10->_options;
    v10->_options = (PTCinematographyFocusFramesOptions *)v11;
  }
  return v10;
}

- (int64_t)startIndexForLinearRackFocusPullToFrameAtIndex:(unint64_t)a3
{
  memset(&v38[1], 0, sizeof(CMTime));
  options = self->_options;
  if (options
    && ([(PTCinematographyFocusFramesOptions *)options minimumRackFocusPullTime],
        v6 = self->_options,
        memset(v38, 0, 24),
        v6))
  {
    [(PTCinematographyFocusFramesOptions *)v6 maximumRackFocusPullTime];
    id v7 = self->_options;
  }
  else
  {
    id v7 = 0;
    memset(v38, 0, 24);
  }
  [(PTCinematographyFocusFramesOptions *)v7 maximumDisparityPerSecond];
  float v9 = v8;
  CMTime time1 = v38[1];
  int64_t v10 = [(PTCinematographyFocusFrames *)self _framesIndex:a3 earlierBy:&time1];
  CMTime time1 = v38[1];
  CMTime time2 = v38[0];
  if (CMTimeCompare(&time1, &time2))
  {
    memset(&time1, 0, sizeof(time1));
    uint64_t v11 = [(NSArray *)self->_frames objectAtIndexedSubscript:a3];
    v12 = v11;
    if (v11) {
      [v11 time];
    }
    else {
      memset(&lhs, 0, sizeof(lhs));
    }
    CMTime time2 = v38[0];
    CMTimeSubtract(&time1, &lhs, &time2);

    v13 = [(NSArray *)self->_frames objectAtIndexedSubscript:a3];
    [v13 focusDistance];
    float v15 = v14;

    if (v10 < 0)
    {
      int64_t v28 = v10;
LABEL_26:
      if (v28 != -1) {
        -[PTCinematographyFocusFrames startIndexForLinearRackFocusPullToFrameAtIndex:]();
      }
      int64_t v10 = -1;
    }
    else
    {
      while (1)
      {
        v16 = [(NSArray *)self->_frames objectAtIndexedSubscript:v10];
        v17 = v16;
        if (v16) {
          [v16 time];
        }
        else {
          memset(&v34, 0, sizeof(v34));
        }
        CMTime time2 = time1;
        int32_t v18 = CMTimeCompare(&v34, &time2);

        if (v18 < 0) {
          break;
        }
        v19 = [(NSArray *)self->_frames objectAtIndexedSubscript:a3];
        v20 = v19;
        if (v19) {
          [v19 time];
        }
        else {
          memset(&v32, 0, sizeof(v32));
        }
        v21 = [(NSArray *)self->_frames objectAtIndexedSubscript:v10];
        v22 = v21;
        if (v21) {
          [v21 time];
        }
        else {
          memset(&rhs, 0, sizeof(rhs));
        }
        CMTimeSubtract(&time, &v32, &rhs);
        float Seconds = CMTimeGetSeconds(&time);

        if (Seconds > 0.0)
        {
          v24 = [(NSArray *)self->_frames objectAtIndexedSubscript:v10];
          [v24 focusDistance];
          float v26 = v25;

          float v27 = fabsf((float)(v15 - v26) / Seconds);
          v10 -= v27 <= v9;
          if (v27 <= v9) {
            break;
          }
        }
        int64_t v28 = v10 - 1;
        if (v10-- <= 0) {
          goto LABEL_26;
        }
      }
    }
    ++v10;
  }
  return v10;
}

- (int64_t)_framesIndex:(unint64_t)a3 earlierBy:(id *)a4
{
  int64_t v5 = a3;
  if ([(NSArray *)self->_frames count] <= a3) {
    -[PTCinematographyFocusFrames _framesIndex:earlierBy:]();
  }
  memset(&v17, 0, sizeof(v17));
  id v7 = [(NSArray *)self->_frames objectAtIndexedSubscript:v5];
  float v8 = v7;
  if (v7) {
    [v7 time];
  }
  else {
    memset(&lhs, 0, sizeof(lhs));
  }
  CMTime rhs = (CMTime)*a4;
  CMTimeSubtract(&v17, &lhs, &rhs);

  if (v5 < 0) {
    -[PTCinematographyFocusFrames _framesIndex:earlierBy:]();
  }
  while (1)
  {
    float v9 = [(NSArray *)self->_frames objectAtIndexedSubscript:v5];
    int64_t v10 = v9;
    if (v9) {
      [v9 time];
    }
    else {
      memset(&time1, 0, sizeof(time1));
    }
    CMTime rhs = v17;
    int32_t v11 = CMTimeCompare(&time1, &rhs);

    if (v11 < 0) {
      break;
    }
    if (v5-- <= 0)
    {
      int64_t v5 = -1;
      return v5 + 1;
    }
  }
  return v5 + 1;
}

- (NSArray)frames
{
  return self->_frames;
}

- (void)setFrames:(id)a3
{
}

- (PTCinematographyFocusFramesOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_frames, 0);
}

- (void)startIndexForLinearRackFocusPullToFrameAtIndex:.cold.1()
{
  __assert_rtn("-[PTCinematographyFocusFrames startIndexForLinearRackFocusPullToFrameAtIndex:]", "PTCinematographyFocusFrames.m", 157, "startIndex >= 0");
}

- (void)_framesIndex:earlierBy:.cold.1()
{
  __assert_rtn("-[PTCinematographyFocusFrames _framesIndex:earlierBy:]", "PTCinematographyFocusFrames.m", 176, "startIndex >= 0");
}

- (void)_framesIndex:earlierBy:.cold.2()
{
}

@end