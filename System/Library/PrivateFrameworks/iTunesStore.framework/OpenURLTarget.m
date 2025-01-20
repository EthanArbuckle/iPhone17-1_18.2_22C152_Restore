@interface OpenURLTarget
- (OpenURLTarget)init;
- (OpenURLTarget)initWithTargetIdentifier:(id)a3;
- (id)copyURLForURL:(id)a3;
- (id)description;
- (int64_t)compare:(id)a3;
@end

@implementation OpenURLTarget

- (OpenURLTarget)init
{
  return [(OpenURLTarget *)self initWithTargetIdentifier:0];
}

- (OpenURLTarget)initWithTargetIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OpenURLTarget;
  v5 = [(OpenURLTarget *)&v11 init];
  v6 = v5;
  if (v5)
  {
    v5->_applicationState = 0;
    v5->_targetIndex = 0x7FFFFFFFFFFFFFFFLL;
    id v7 = objc_alloc_init(MEMORY[0x263F28178]);
    int64_t v8 = 0;
    v9 = &__OpenURLTargetData;
    do
    {
      if ([v4 isEqualToString:*(void *)v9])
      {
        v6->_applicationState = [v7 applicationStateForApplication:v4];
        *(_OWORD *)&v6->_targetData.clientIdentifier = *v9;
        v6->_targetData.secureScheme = (NSString *)*((void *)v9 + 2);
        v6->_targetIndex = v8;
        goto LABEL_8;
      }
      ++v8;
      v9 = (long long *)((char *)v9 + 24);
    }
    while (v8 != 9);
    if (v6->_targetIndex == 0x7FFFFFFFFFFFFFFFLL)
    {

      v6 = 0;
    }
LABEL_8:
    [v7 invalidate];
  }
  return v6;
}

- (int64_t)compare:(id)a3
{
  unsigned int applicationState = self->_applicationState;
  int v5 = applicationState == 8 || applicationState == 32;
  int v6 = *((_DWORD *)a3 + 2);
  int v8 = v6 == 8 || v6 == 32;
  if (v5 == v8)
  {
    int64_t targetIndex = self->_targetIndex;
    int64_t v11 = *((void *)a3 + 5);
    BOOL v12 = targetIndex == v11;
    BOOL v13 = targetIndex < v11;
    int64_t v14 = -1;
    if (!v13) {
      int64_t v14 = 1;
    }
    if (v12) {
      return 0;
    }
    else {
      return v14;
    }
  }
  else if (v5)
  {
    return -1;
  }
  else
  {
    return 1;
  }
}

- (id)copyURLForURL:(id)a3
{
  id v4 = a3;
  int v5 = [v4 scheme];
  if ([v5 isEqualToString:@"http"])
  {
    uint64_t v6 = 24;
  }
  else
  {
    if (![v5 isEqualToString:@"https"])
    {
      id v7 = 0;
LABEL_9:
      int64_t v11 = (void *)[v4 copy];
      goto LABEL_10;
    }
    uint64_t v6 = 32;
  }
  id v7 = *(id *)((char *)&self->super.isa + v6);
  if (!v7) {
    goto LABEL_9;
  }
  int v8 = [v4 absoluteString];
  v9 = objc_msgSend(v8, "substringFromIndex:", objc_msgSend(v5, "length"));
  v10 = [v7 stringByAppendingString:v9];

  int64_t v11 = (void *)[objc_alloc(NSURL) initWithString:v10];
  if (!v11) {
    goto LABEL_9;
  }
LABEL_10:

  return v11;
}

- (id)description
{
  unsigned int applicationState = self->_applicationState;
  id v4 = @"Unknown";
  switch(applicationState)
  {
    case 1u:
      id v4 = @"Terminated";
      break;
    case 2u:
      id v4 = @"Background Task Suspended";
      break;
    case 3u:
    case 5u:
    case 6u:
    case 7u:
      break;
    case 4u:
      id v4 = @"Background Running";
      break;
    case 8u:
      id v4 = @"Foreground Running";
      break;
    default:
      int v5 = @"Foreground Running Obscured";
      if (applicationState != 32) {
        int v5 = @"Unknown";
      }
      if (applicationState == 16) {
        id v4 = @"Process Server";
      }
      else {
        id v4 = v5;
      }
      break;
  }
  uint64_t v6 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)OpenURLTarget;
  id v7 = [(OpenURLTarget *)&v10 description];
  int v8 = [v6 stringWithFormat:@"%@: (%@, %@)", v7, self->_targetData.clientIdentifier, v4];

  return v8;
}

@end