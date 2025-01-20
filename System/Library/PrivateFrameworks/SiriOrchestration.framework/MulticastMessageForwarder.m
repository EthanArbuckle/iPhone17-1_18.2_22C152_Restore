@interface MulticastMessageForwarder
- (BOOL)respondsToSelector:(SEL)a3;
- (MulticastMessageForwarder)init;
- (NSMutableArray)receivers;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)addReceiver:(id)a3;
- (void)cleanupNilReceivers;
- (void)forwardInvocation:(id)a3;
- (void)removeReceiver:(id)a3;
- (void)setReceivers:(id)a3;
@end

@implementation MulticastMessageForwarder

- (MulticastMessageForwarder)init
{
  v6.receiver = self;
  v6.super_class = (Class)MulticastMessageForwarder;
  v2 = [(MulticastMessageForwarder *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    receivers = v2->_receivers;
    v2->_receivers = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)addReceiver:(id)a3
{
  id v4 = a3;
  v5 = [(MulticastMessageForwarder *)self receivers];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __41__MulticastMessageForwarder_addReceiver___block_invoke;
  v10[3] = &unk_26550EC88;
  id v6 = v4;
  id v11 = v6;
  uint64_t v7 = [v5 indexOfObjectPassingTest:v10];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = [(MulticastMessageForwarder *)self receivers];
    v9 = [[Receiver alloc] initWithWrappedObject:v6];
    [v8 addObject:v9];
  }
  -[MulticastMessageForwarder cleanupNilReceivers](self);
}

BOOL __41__MulticastMessageForwarder_addReceiver___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6 = [a2 wrappedObject];
  *a4 = v6 == *(void **)(a1 + 32);

  return *a4;
}

- (void)cleanupNilReceivers
{
  if (a1)
  {
    v2 = [MEMORY[0x263F089C8] indexSet];
    uint64_t v3 = [a1 receivers];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __48__MulticastMessageForwarder_cleanupNilReceivers__block_invoke;
    v6[3] = &unk_26550ECB0;
    id v4 = v2;
    id v7 = v4;
    [v3 enumerateObjectsUsingBlock:v6];

    if ([v4 count])
    {
      v5 = [a1 receivers];
      [v5 removeObjectsAtIndexes:v4];
    }
  }
}

- (void)removeReceiver:(id)a3
{
  id v4 = a3;
  v5 = [(MulticastMessageForwarder *)self receivers];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__MulticastMessageForwarder_removeReceiver___block_invoke;
  v9[3] = &unk_26550EC88;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 indexOfObjectPassingTest:v9];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = [(MulticastMessageForwarder *)self receivers];
    [v8 removeObjectAtIndex:v7];
  }
  -[MulticastMessageForwarder cleanupNilReceivers](self);
}

BOOL __44__MulticastMessageForwarder_removeReceiver___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6 = [a2 wrappedObject];
  *a4 = v6 == *(void **)(a1 + 32);

  return *a4;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [(MulticastMessageForwarder *)self receivers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [*(id *)(*((void *)&v12 + 1) + 8 * i) wrappedObject];
        char v9 = objc_opt_respondsToSelector();

        if (v9)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [(MulticastMessageForwarder *)self receivers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        BOOL v10 = [v9 wrappedObject];
        char v11 = objc_opt_respondsToSelector();

        if (v11)
        {
          long long v13 = [v9 wrappedObject];
          long long v12 = [v13 methodSignatureForSelector:a3];

          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  long long v12 = 0;
LABEL_11:

  return v12;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (const char *)[v4 selector];
  uint64_t v6 = [v4 methodSignature];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v20 = self;
  id obj = [(MulticastMessageForwarder *)self receivers];
  uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    uint64_t v21 = *(void *)v27;
    do
    {
      uint64_t v10 = 0;
      uint64_t v22 = v8;
      do
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        char v11 = [*(id *)(*((void *)&v26 + 1) + 8 * v10) wrappedObject];
        if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v24 = v11;
          long long v12 = [MEMORY[0x263EFF958] invocationWithMethodSignature:v6];
          [v12 setSelector:v5];
          if ((unint64_t)[v6 numberOfArguments] >= 3)
          {
            uint64_t v13 = 2;
            while (2)
            {
              id v14 = v6;
              long long v15 = (unsigned char *)[v14 getArgumentTypeAtIndex:v13];
              unsigned int v16 = *v15;
              if (v16 > 0x5D)
              {
                switch(*v15)
                {
                  case '^':
                  case 'd':
                    goto LABEL_21;
                  case '_':
                  case 'a':
                  case 'b':
                  case 'e':
                  case 'g':
                  case 'h':
                    goto LABEL_20;
                  case 'c':
                    goto LABEL_13;
                  case 'f':
                  case 'i':
                    goto LABEL_14;
                  default:
                    if (v16 == 113) {
                      goto LABEL_21;
                    }
                    if (v16 == 115) {
                      goto LABEL_17;
                    }
                    goto LABEL_20;
                }
              }
              switch(*v15)
              {
                case '@':
                  goto LABEL_21;
                case 'A':
                case 'D':
                case 'E':
                case 'F':
                case 'G':
                case 'H':
                  goto LABEL_20;
                case 'B':
                case 'C':
LABEL_13:
                  LOBYTE(v25) = 0;
                  goto LABEL_22;
                case 'I':
LABEL_14:
                  LODWORD(v25) = 0;
                  goto LABEL_22;
                default:
                  if (v16 == 81)
                  {
LABEL_21:
                    uint64_t v25 = 0;
                  }
                  else
                  {
                    if (v16 != 83)
                    {
LABEL_20:
                      long long v17 = (void *)MEMORY[0x263EFF940];
                      NSStringFromSelector(v5);
                      v19 = long long v18 = v5;
                      [v17 raise:@"UnsupportedArgument", @"Selector %@ has unsupported argument typed %s at index %lu", v19, v15, v13 format];

                      uint64_t v5 = v18;
                      goto LABEL_23;
                    }
LABEL_17:
                    LOWORD(v25) = 0;
                  }
LABEL_22:
                  [v4 getArgument:&v25 atIndex:v13];
                  [v12 setArgument:&v25 atIndex:v13];
LABEL_23:
                  if (++v13 >= (unint64_t)[v14 numberOfArguments]) {
                    break;
                  }
                  continue;
              }
              break;
            }
          }
          char v11 = v24;
          [v12 invokeWithTarget:v24];

          uint64_t v9 = v21;
          uint64_t v8 = v22;
        }

        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }

  -[MulticastMessageForwarder cleanupNilReceivers](v20);
}

void __48__MulticastMessageForwarder_cleanupNilReceivers__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 wrappedObject];

  if (!v5)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    [v6 addIndex:a3];
  }
}

- (NSMutableArray)receivers
{
  return self->_receivers;
}

- (void)setReceivers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end