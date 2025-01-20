@interface SACallTreeTruncatedLeafCallstacks
+ (id)callTreeFrameWithFrame:(id)a3 startSampleIndex:(unint64_t)a4 sampleCount:(unint64_t)a5 isLeafFrame:(BOOL)a6;
+ (id)callTreeFrameWithFrame:(uint64_t)a3 startSampleIndex:(uint64_t)a4 sampleCount:(void *)a5 otherCallTreeDescription:;
- (BOOL)isTruncatedLeafCallstack;
- (SACallTreeTruncatedLeafCallstacks)initWithFrame:(id)a3 startSampleIndex:(unint64_t)a4 sampleCount:(unint64_t)a5 otherCallTreeDescription:(id)a6;
- (void)writeJSONDictionaryEntriesToStream:(id)a3;
@end

@implementation SACallTreeTruncatedLeafCallstacks

- (BOOL)isTruncatedLeafCallstack
{
  return 1;
}

+ (id)callTreeFrameWithFrame:(id)a3 startSampleIndex:(unint64_t)a4 sampleCount:(unint64_t)a5 isLeafFrame:(BOOL)a6
{
  id v6 = a3;
  int v7 = *__error();
  v8 = _sa_logt();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v9 = [v6 debugDescription];
    *(_DWORD *)buf = 136315138;
    uint64_t v20 = [v9 UTF8String];
    _os_log_error_impl(&dword_1BF22B000, v8, OS_LOG_TYPE_ERROR, "SACallTreeTruncatedLeafCallstacks using wrong creator for %s", buf, 0xCu);
  }
  *__error() = v7;
  id v10 = [v6 debugDescription];
  char v11 = [v10 UTF8String];
  _SASetCrashLogMessage(327, "SACallTreeTruncatedLeafCallstacks using wrong creator for %s", v12, v13, v14, v15, v16, v17, v11);

  id result = (id)_os_crash();
  __break(1u);
  return result;
}

- (SACallTreeTruncatedLeafCallstacks)initWithFrame:(id)a3 startSampleIndex:(unint64_t)a4 sampleCount:(unint64_t)a5 otherCallTreeDescription:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)SACallTreeTruncatedLeafCallstacks;
  uint64_t v12 = [(SACallTreeFrame *)&v15 initWithFrame:a3 startSampleIndex:a4 sampleCount:a5 isLeafFrame:1];
  uint64_t v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_otherCallTreeDescription, a6);
  }

  return v13;
}

+ (id)callTreeFrameWithFrame:(uint64_t)a3 startSampleIndex:(uint64_t)a4 sampleCount:(void *)a5 otherCallTreeDescription:
{
  id v8 = a5;
  id v9 = a2;
  id v10 = (void *)[objc_alloc((Class)self) initWithFrame:v9 startSampleIndex:a3 sampleCount:a4 otherCallTreeDescription:v8];

  return v10;
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  otherCallTreeDescription = self->_otherCallTreeDescription;
  id v5 = a3;
  SAJSONWriteDictionaryFirstEntry(v5, @"otherCallTree", otherCallTreeDescription);
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SACallTreeNode sampleCount](self, "sampleCount"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v5, @"count", v6);
}

- (void).cxx_destruct
{
}

@end