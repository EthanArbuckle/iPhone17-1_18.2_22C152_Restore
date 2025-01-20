@interface CSDPauseDigitsQueue
- (BOOL)hasQueuedHardPauseDigits;
- (CSDPauseDigits)nextPauseDigits;
- (CSDPauseDigitsQueue)init;
- (CSDPauseDigitsQueue)initWithDestinationID:(id)a3;
- (CSDPauseDigitsQueueDelegate)delegate;
- (NSMutableArray)pauseDigits;
- (NSString)baseDestinationID;
- (NSString)originalPauseDigitsString;
- (id)dequeueAllPauseDigits;
- (id)dequeueNextPauseDigits;
- (id)description;
- (void)_parsePauseDigitsFromDestinationID:(id)a3;
- (void)setBaseDestinationID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOriginalPauseDigitsString:(id)a3;
- (void)setPauseDigits:(id)a3;
@end

@implementation CSDPauseDigitsQueue

- (CSDPauseDigitsQueue)init
{
  v4 = +[NSAssertionHandler currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CSDPauseDigitsQueue.m", 23, @"%s is not available. Use a designated initializer instead.", "-[CSDPauseDigitsQueue init]");

  return 0;
}

- (CSDPauseDigitsQueue)initWithDestinationID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSDPauseDigitsQueue;
  v5 = [(CSDPauseDigitsQueue *)&v9 init];
  if (v5)
  {
    uint64_t v6 = +[NSMutableArray array];
    pauseDigits = v5->_pauseDigits;
    v5->_pauseDigits = (NSMutableArray *)v6;

    [(CSDPauseDigitsQueue *)v5 _parsePauseDigitsFromDestinationID:v4];
  }

  return v5;
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = [(CSDPauseDigitsQueue *)self baseDestinationID];
  [v3 appendFormat:@" baseDestinationID=%@", v4];

  v5 = [(CSDPauseDigitsQueue *)self originalPauseDigitsString];
  [v3 appendFormat:@" originalPauseDigitsString=%@", v5];

  uint64_t v6 = [(CSDPauseDigitsQueue *)self pauseDigits];
  id v7 = [v6 count];

  if (v7)
  {
    v8 = [(CSDPauseDigitsQueue *)self pauseDigits];
    [v3 appendFormat:@" pauseDigits=%@", v8];
  }
  [v3 appendString:@">"];

  return v3;
}

- (CSDPauseDigits)nextPauseDigits
{
  v2 = [(CSDPauseDigitsQueue *)self pauseDigits];
  v3 = [v2 firstObject];

  return (CSDPauseDigits *)v3;
}

- (BOOL)hasQueuedHardPauseDigits
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(CSDPauseDigitsQueue *)self pauseDigits];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isHardPause])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (id)dequeueNextPauseDigits
{
  id v3 = [(CSDPauseDigitsQueue *)self nextPauseDigits];
  if (v3)
  {
    uint64_t v4 = [(CSDPauseDigitsQueue *)self pauseDigits];
    [v4 removeObjectAtIndex:0];

    v5 = [(CSDPauseDigitsQueue *)self delegate];
    [v5 pauseDigitsQueueChanged:self];
  }

  return v3;
}

- (id)dequeueAllPauseDigits
{
  id v3 = [(CSDPauseDigitsQueue *)self pauseDigits];
  id v4 = [v3 count];

  if (v4)
  {
    v5 = [(CSDPauseDigitsQueue *)self pauseDigits];
    id v6 = [v5 copy];

    long long v7 = [(CSDPauseDigitsQueue *)self pauseDigits];
    [v7 removeAllObjects];

    long long v8 = [(CSDPauseDigitsQueue *)self delegate];
    [v8 pauseDigitsQueueChanged:self];
  }
  else
  {
    id v6 = &__NSArray0__struct;
  }

  return v6;
}

- (void)_parsePauseDigitsFromDestinationID:(id)a3
{
  id v20 = a3;
  if (qword_10058C360 != -1) {
    dispatch_once(&qword_10058C360, &stru_100506BF0);
  }
  id v4 = (char *)[v20 length];
  v5 = (char *)objc_msgSend(v20, "rangeOfCharacterFromSet:options:range:", qword_10058C358, 4, 0, v4);
  if (v6) {
    BOOL v7 = v5 == (char *)0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    long long v8 = v5;
    uint64_t v9 = v6;
    do
    {
      long long v10 = v8 + 1;
      v11 = objc_msgSend(v20, "substringWithRange:", v8, v9);
      id v12 = [v11 characterAtIndex:0];

      v13 = objc_msgSend(v20, "substringWithRange:", v10, v4 - v10);
      id v14 = [(id)qword_10058C350 characterIsMember:v12];
      if ([v13 length] || (v14 & 1) == 0)
      {
        v15 = [[CSDPauseDigits alloc] initWithDigits:v13 isHardPause:v14];
        v16 = [(CSDPauseDigitsQueue *)self pauseDigits];
        [v16 insertObject:v15 atIndex:0];
      }
      v4 += ~(unint64_t)[v13 length];
      long long v8 = (char *)objc_msgSend(v20, "rangeOfCharacterFromSet:options:range:", qword_10058C358, 4, 0, v4);
      uint64_t v9 = v17;
    }
    while (v9 && v8 != (char *)0x7FFFFFFFFFFFFFFFLL);
  }
  v18 = objc_msgSend(v20, "substringWithRange:", 0, v4);
  [(CSDPauseDigitsQueue *)self setBaseDestinationID:v18];

  v19 = [v20 substringFromIndex:v4];
  [(CSDPauseDigitsQueue *)self setOriginalPauseDigitsString:v19];
}

- (CSDPauseDigitsQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSDPauseDigitsQueueDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)baseDestinationID
{
  return self->_baseDestinationID;
}

- (void)setBaseDestinationID:(id)a3
{
}

- (NSString)originalPauseDigitsString
{
  return self->_originalPauseDigitsString;
}

- (void)setOriginalPauseDigitsString:(id)a3
{
}

- (NSMutableArray)pauseDigits
{
  return self->_pauseDigits;
}

- (void)setPauseDigits:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseDigits, 0);
  objc_storeStrong((id *)&self->_originalPauseDigitsString, 0);
  objc_storeStrong((id *)&self->_baseDestinationID, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end