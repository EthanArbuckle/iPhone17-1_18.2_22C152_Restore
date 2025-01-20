@interface TIProgressTracker
- (BOOL)limitsReached;
- (BOOL)shouldStopAfterAddingStateString:(id)a3;
- (NSCountedSet)priorStates;
- (NSDate)startTime;
- (NSMutableArray)stateTranscript;
- (NSString)badSentenceFilePath;
- (NSString)badSentenceTranscriptFilePath;
- (NSString)intended;
- (TIProgressTracker)initWithIntendedString:(id)a3 repeatLimit:(int64_t)a4 timeout:(double)a5 badSentencePath:(id)a6;
- (double)timeout;
- (int64_t)repeatLimit;
- (unint64_t)stoppageReason;
- (void)appendStringToFile:(id)a3 atFilePath:(id)a4;
- (void)saveBadSentenceAndTranscript:(unint64_t)a3;
- (void)setBadSentenceFilePath:(id)a3;
- (void)setBadSentenceTranscriptFilePath:(id)a3;
- (void)setIntended:(id)a3;
- (void)setPriorStates:(id)a3;
- (void)setRepeatLimit:(int64_t)a3;
- (void)setStartTime:(id)a3;
- (void)setStateTranscript:(id)a3;
- (void)setTimeout:(double)a3;
@end

@implementation TIProgressTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badSentenceTranscriptFilePath, 0);
  objc_storeStrong((id *)&self->_badSentenceFilePath, 0);
  objc_storeStrong((id *)&self->_stateTranscript, 0);
  objc_storeStrong((id *)&self->_priorStates, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_intended, 0);
}

- (void)setBadSentenceTranscriptFilePath:(id)a3
{
}

- (NSString)badSentenceTranscriptFilePath
{
  return self->_badSentenceTranscriptFilePath;
}

- (void)setBadSentenceFilePath:(id)a3
{
}

- (NSString)badSentenceFilePath
{
  return self->_badSentenceFilePath;
}

- (void)setStateTranscript:(id)a3
{
}

- (NSMutableArray)stateTranscript
{
  return self->_stateTranscript;
}

- (void)setPriorStates:(id)a3
{
}

- (NSCountedSet)priorStates
{
  return self->_priorStates;
}

- (void)setStartTime:(id)a3
{
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setIntended:(id)a3
{
}

- (NSString)intended
{
  return self->_intended;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setRepeatLimit:(int64_t)a3
{
  self->_repeatLimit = a3;
}

- (int64_t)repeatLimit
{
  return self->_repeatLimit;
}

- (BOOL)limitsReached
{
  return self->_limitsReached;
}

- (void)appendStringToFile:(id)a3 atFilePath:(id)a4
{
  id v12 = a4;
  if (v12)
  {
    v5 = (void *)MEMORY[0x263F08850];
    id v6 = a3;
    v7 = [v5 defaultManager];
    if (([v7 fileExistsAtPath:v12] & 1) == 0
      && ([v7 createFileAtPath:v12 contents:0 attributes:0] & 1) == 0)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "Error: unable to write log file '%s'.\n", (const char *)[v12 UTF8String]);
    }
    v8 = [MEMORY[0x263F08840] fileHandleForWritingAtPath:v12];
    [v8 seekToEndOfFile];
    v9 = [v6 dataUsingEncoding:4];

    [v8 writeData:v9];
    [v8 closeFile];
  }
  else
  {
    v10 = (void *)MEMORY[0x263F08840];
    id v11 = a3;
    v8 = [v10 fileHandleWithStandardOutput];
    v7 = [v11 dataUsingEncoding:4];

    [v8 writeData:v7];
  }
}

- (void)saveBadSentenceAndTranscript:(unint64_t)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  v5 = [(TIProgressTracker *)self badSentenceFilePath];

  if (v5)
  {
    id v6 = [(TIProgressTracker *)self intended];
    v7 = [(TIProgressTracker *)self badSentenceFilePath];
    [(TIProgressTracker *)self appendStringToFile:v6 atFilePath:v7];
  }
  v8 = NSString;
  v9 = [(TIProgressTracker *)self intended];
  v10 = [v8 stringWithFormat:@"> %-10@ >> %@", @"Intended", v9];

  id v11 = NSString;
  if (a3 > 3) {
    id v12 = 0;
  }
  else {
    id v12 = off_26504F878[a3];
  }
  v13 = [(TIProgressTracker *)self stateTranscript];
  v14 = [v13 lastObject];
  v15 = [v11 stringWithFormat:@"> %-10@ << %@", v12, v14];

  v22[0] = v10;
  v22[1] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  v17 = [(TIProgressTracker *)self stateTranscript];
  v18 = [v16 arrayByAddingObjectsFromArray:v17];

  v19 = [v18 componentsJoinedByString:@"\n"];
  v20 = [v19 stringByAppendingString:@"\n\n"];

  v21 = [(TIProgressTracker *)self badSentenceTranscriptFilePath];
  [(TIProgressTracker *)self appendStringToFile:v20 atFilePath:v21];
}

- (unint64_t)stoppageReason
{
  v3 = [(TIProgressTracker *)self stateTranscript];
  v4 = [v3 lastObject];

  v5 = [MEMORY[0x263EFF910] now];
  id v6 = [(TIProgressTracker *)self startTime];
  [v5 timeIntervalSinceDate:v6];
  double v8 = v7;

  v9 = [(TIProgressTracker *)self priorStates];
  uint64_t v10 = [v9 countForObject:v4];

  id v11 = [(TIProgressTracker *)self intended];
  char v12 = [v11 isEqualToString:v4];

  if (v12)
  {
    unint64_t v13 = 0;
  }
  else if (v10 <= [(TIProgressTracker *)self repeatLimit])
  {
    [(TIProgressTracker *)self timeout];
    if (v8 <= v14) {
      unint64_t v13 = 3;
    }
    else {
      unint64_t v13 = 2;
    }
  }
  else
  {
    unint64_t v13 = 1;
  }

  return v13;
}

- (BOOL)shouldStopAfterAddingStateString:(id)a3
{
  v4 = [NSString stringWithString:a3];
  v5 = [(TIProgressTracker *)self priorStates];
  [v5 addObject:v4];

  id v6 = [(TIProgressTracker *)self stateTranscript];
  [v6 addObject:v4];

  double v7 = [MEMORY[0x263EFF910] now];
  double v8 = [(TIProgressTracker *)self startTime];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  id v11 = [(TIProgressTracker *)self priorStates];
  uint64_t v12 = [v11 countForObject:v4];

  if (v12 <= [(TIProgressTracker *)self repeatLimit]
    && ([(TIProgressTracker *)self timeout], v10 <= v13))
  {
    BOOL v14 = 0;
  }
  else
  {
    [(TIProgressTracker *)self saveBadSentenceAndTranscript:[(TIProgressTracker *)self stoppageReason]];
    BOOL v14 = 1;
  }

  return v14;
}

- (TIProgressTracker)initWithIntendedString:(id)a3 repeatLimit:(int64_t)a4 timeout:(double)a5 badSentencePath:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)TIProgressTracker;
  double v13 = [(TIProgressTracker *)&v24 init];
  BOOL v14 = v13;
  if (v13)
  {
    v13->_repeatLimit = a4;
    v13->_timeout = a5;
    objc_storeStrong((id *)&v13->_intended, a3);
    uint64_t v15 = [MEMORY[0x263EFF910] now];
    startTime = v14->_startTime;
    v14->_startTime = (NSDate *)v15;

    uint64_t v17 = [objc_alloc(MEMORY[0x263F08760]) initWithCapacity:100];
    priorStates = v14->_priorStates;
    v14->_priorStates = (NSCountedSet *)v17;

    uint64_t v19 = [MEMORY[0x263EFF980] arrayWithCapacity:200];
    stateTranscript = v14->_stateTranscript;
    v14->_stateTranscript = (NSMutableArray *)v19;

    uint64_t v21 = [v12 copy];
    badSentenceFilePath = v14->_badSentenceFilePath;
    v14->_badSentenceFilePath = (NSString *)v21;
  }
  return v14;
}

@end