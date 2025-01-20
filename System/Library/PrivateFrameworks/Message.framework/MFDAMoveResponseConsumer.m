@interface MFDAMoveResponseConsumer
- (MFDAMoveResponseConsumer)initWithSourceRemoteIDs:(id)a3 destinationRemoteIDsBySourceRemoteIDs:(id)a4 failures:(id)a5;
- (MFError)error;
- (int64_t)statusCode;
- (void)resultsForMessageMove:(id)a3;
- (void)setError:(id)a3;
- (void)taskFailed:(id)a3 statusCode:(int64_t)a4 error:(id)a5;
@end

@implementation MFDAMoveResponseConsumer

- (MFDAMoveResponseConsumer)initWithSourceRemoteIDs:(id)a3 destinationRemoteIDsBySourceRemoteIDs:(id)a4 failures:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MFDAMoveResponseConsumer;
  v12 = [(MFDAMailAccountConsumer *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sourceRemoteIDs, a3);
    objc_storeStrong((id *)&v13->_destinationRemoteIDsBySourceRemoteIDs, a4);
    objc_storeStrong((id *)&v13->_failures, a5);
    v13->_statusCode = 2;
  }

  return v13;
}

- (void)taskFailed:(id)a3 statusCode:(int64_t)a4 error:(id)a5
{
  id v11 = a3;
  id v8 = a5;
  self->_statusCode = a4;
  if (((a4 - 63) & 0xFFFFFFFFFFFFFFEFLL) != 0) {
    uint64_t v9 = 1030;
  }
  else {
    uint64_t v9 = 1032;
  }
  id v10 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:v9 localizedDescription:0];
  if (v10)
  {
    [(NSMutableSet *)self->_failures unionSet:self->_sourceRemoteIDs];
    [(MFDAMoveResponseConsumer *)self setError:v10];
  }
}

- (void)resultsForMessageMove:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v16;
    *(void *)&long long v6 = 138543362;
    long long v14 = v6;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
        id v10 = objc_msgSend(v9, "sourceID", v14);
        if (!v10 || ![(NSSet *)self->_sourceRemoteIDs containsObject:v10])
        {
          id v11 = DALoggingwithCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v20 = v9;
            __int16 v21 = 2112;
            v22 = v10;
            _os_log_impl(&dword_1A7EFF000, v11, OS_LOG_TYPE_DEFAULT, "got %@ with untracked sourceID \"%@\"", buf, 0x16u);
          }
          goto LABEL_13;
        }
        if ([v9 status] == 3)
        {
          id v11 = [v9 destID];
          if (v11)
          {
            [(NSMutableDictionary *)self->_destinationRemoteIDsBySourceRemoteIDs setObject:v11 forKeyedSubscript:v10];
          }
          else
          {
            v12 = DALoggingwithCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v14;
              v20 = v10;
              _os_log_impl(&dword_1A7EFF000, v12, OS_LOG_TYPE_DEFAULT, "Move succeeded but missing new remote ID for message ID: %{public}@", buf, 0xCu);
            }
          }
LABEL_13:

          goto LABEL_14;
        }
        [(NSMutableSet *)self->_failures addObject:v10];
LABEL_14:

        ++v8;
      }
      while (v5 != v8);
      uint64_t v13 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
      uint64_t v5 = v13;
    }
    while (v13);
  }

  [(MFDAMailAccountConsumer *)self setDone:1];
}

- (MFError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_failures, 0);
  objc_storeStrong((id *)&self->_destinationRemoteIDsBySourceRemoteIDs, 0);
  objc_storeStrong((id *)&self->_sourceRemoteIDs, 0);
}

@end