@interface _PIVideoStabilizeResult
- ($FD18CD26FAB5729647810B74E671536E)stabCropRect;
- (NSArray)keyframes;
- (NSDictionary)rawHomographies;
- (_PIVideoStabilizeResult)initWithKeyframes:(id)a3 stabCropRect:(id *)a4 analysisType:(unint64_t)a5 rawHomographies:(id)a6;
- (unint64_t)analysisType;
@end

@implementation _PIVideoStabilizeResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawHomographies, 0);
  objc_storeStrong((id *)&self->_keyframes, 0);
}

- (NSDictionary)rawHomographies
{
  return self->_rawHomographies;
}

- (unint64_t)analysisType
{
  return self->_analysisType;
}

- ($FD18CD26FAB5729647810B74E671536E)stabCropRect
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[1].var1.var1;
  retstr->var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[1].var0.var1;
  retstr->var1 = v3;
  return self;
}

- (NSArray)keyframes
{
  return self->_keyframes;
}

- (_PIVideoStabilizeResult)initWithKeyframes:(id)a3 stabCropRect:(id *)a4 analysisType:(unint64_t)a5 rawHomographies:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_PIVideoStabilizeResult;
  v12 = [(_PIVideoStabilizeResult *)&v20 init];
  v13 = v12;
  if (v12)
  {
    v12->_analysisType = a5;
    uint64_t v14 = [v10 copy];
    keyframes = v13->_keyframes;
    v13->_keyframes = (NSArray *)v14;

    $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a4->var1;
    v13->_stabCropRect.origin = ($86B46DF249C2B4242DBB096758D29184)a4->var0;
    v13->_stabCropRect.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)var1;
    uint64_t v17 = [v11 copy];
    rawHomographies = v13->_rawHomographies;
    v13->_rawHomographies = (NSDictionary *)v17;
  }
  return v13;
}

@end