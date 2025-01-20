@interface MRAction
- (MCAction)mcAction;
- (MRAction)initWithAction:(id)a3 andTarget:(id)a4;
- (MRAction)initWithAction:(id)a3 inRenderer:(id)a4;
- (MRAction)initWithBlock:(id)a3 andSender:(id)a4;
- (MRAction)initWithSelector:(SEL)a3 sender:(id)a4 andTargetPath:(id)a5 inRenderer:(id)a6;
- (MRLayer)resolvedTarget;
- (NSMutableDictionary)states;
- (NSString)targetPath;
- (double)invoke;
- (double)time;
- (id)description;
- (id)sender;
- (id)specificObject;
- (void)_resolveTargetPath:(id)a3;
- (void)dealloc;
- (void)setResolvedTarget:(id)a3;
- (void)setSender:(id)a3;
- (void)setSpecificObject:(id)a3;
- (void)setStates:(id)a3;
- (void)setTargetPath:(id)a3;
- (void)setTime:(double)a3;
@end

@implementation MRAction

- (MRAction)initWithAction:(id)a3 inRenderer:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MRAction;
  v6 = [(MRAction *)&v9 init];
  if (v6)
  {
    v7 = (MCAction *)a3;
    v6->_renderer = (MRRenderer *)a4;
    v6->_mcAction = v7;
    v6->_targetPath = (NSString *)[(NSString *)[(MCAction *)v7 targetObjectID] copy];
  }
  return v6;
}

- (MRAction)initWithAction:(id)a3 andTarget:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MRAction;
  v6 = [(MRAction *)&v8 init];
  if (v6)
  {
    v6->_mcAction = (MCAction *)a3;
    v6->_resolvedTarget = (MRLayer *)a4;
  }
  return v6;
}

- (MRAction)initWithSelector:(SEL)a3 sender:(id)a4 andTargetPath:(id)a5 inRenderer:(id)a6
{
  v14.receiver = self;
  v14.super_class = (Class)MRAction;
  v10 = [(MRAction *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_renderer = (MRRenderer *)a6;
    v12 = +[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", +[NSMethodSignature signatureWithObjCTypes:"d@:@"]);
    v11->_invocation = v12;
    [(NSInvocation *)v12 setSelector:a3];
    v11->_sender = a4;
    v11->_targetPath = (NSString *)[a5 copy];
  }
  return v11;
}

- (MRAction)initWithBlock:(id)a3 andSender:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MRAction;
  v6 = [(MRAction *)&v8 init];
  if (v6)
  {
    v6->_block = [a3 copy];
    v6->_sender = a4;
  }
  return v6;
}

- (void)dealloc
{
  self->_renderer = 0;
  self->_mcAction = 0;

  self->_invocation = 0;
  self->_block = 0;

  self->_sender = 0;
  self->_resolvedTarget = 0;

  self->_states = 0;
  self->_specificObject = 0;
  v3.receiver = self;
  v3.super_class = (Class)MRAction;
  [(MRAction *)&v3 dealloc];
}

- (id)description
{
  return -[NSString stringByAppendingFormat:](-[NSString stringByAppendingFormat:](-[NSString stringByAppendingFormat:](+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"MRAction: self=%p", self), "stringByAppendingFormat:", @"\n\tmMCAction: %@", self->_mcAction), "stringByAppendingFormat:", @"\n\tmSender: %@ (%p)", [self->_sender performSelector:"idInSupercontainer"], self->_sender), "stringByAppendingFormat:", @"\n\tmResolvedTarget: %@ (%p)", -[MRLayer performSelector:](self->_resolvedTarget, "performSelector:", "idInSupercontainer"), self->_resolvedTarget);
}

- (double)invoke
{
  double v6 = 0.0;
  v7 = self;
  id block = self->_block;
  if (block)
  {
    v4 = (void (*)(void))*((void *)block + 2);
    v4();
  }
  else if (self->_invocation)
  {
    [(NSInvocation *)self->_invocation setTarget:[(MRAction *)self resolvedTarget]];
    [(NSInvocation *)self->_invocation setArgument:&v7 atIndex:2];
    [(NSInvocation *)v7->_invocation invoke];
    [(NSInvocation *)v7->_invocation getReturnValue:&v6];
    return v6;
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (MRLayer)resolvedTarget
{
  if (!self->_resolvedTarget)
  {
    if ([(NSString *)self->_targetPath hasPrefix:@"/"])
    {
      renderer = self->_renderer;
      if (renderer)
      {
        v4 = (MRLayer *)[(MRRenderer *)renderer _layerForPlugObjectID:self->_targetPath];
        self->_resolvedTarget = v4;
        if (!v4) {
          goto LABEL_8;
        }
      }
      else if (!self->_resolvedTarget)
      {
LABEL_8:
        NSLog(@"Error: could not resolve action target path '%@'.", self->_targetPath);
      }
    }
    else
    {
      [(MRAction *)self _resolveTargetPath:self->_targetPath];
    }
  }
  return self->_resolvedTarget;
}

- (void)_resolveTargetPath:(id)a3
{
  id sender = self->_sender;
  if (![a3 length]) {
    goto LABEL_21;
  }
  id v6 = [a3 componentsSeparatedByString:@"/"];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v7) {
    goto LABEL_21;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v16;
  do
  {
    v10 = 0;
    do
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v10);
      if ([v11 isEqualToString:@".."])
      {
        id v12 = [sender superlayer];
        goto LABEL_14;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_13;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v11 isEqualToString:@"@currentSublayer"]) {
          id v12 = [sender currentSublayer];
        }
        else {
LABEL_13:
        }
          id v12 = [sender sublayerForKey:v11];
LABEL_14:
        id sender = v12;
        goto LABEL_15;
      }
      if (self->_resolvedTarget) {
        id sender = 0;
      }
      else {
        NSLog(@"Consistency error: non-terminal layer in action target path is not a collection layer.");
      }
LABEL_15:
      v10 = (char *)v10 + 1;
    }
    while (v8 != v10);
    id v13 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    id v8 = v13;
  }
  while (v13);
LABEL_21:
  if (sender) {
    self->_resolvedTarget = (MRLayer *)sender;
  }
  else {
    NSLog(@"Error: could not resolve action target path '%@'.", a3);
  }
}

- (MCAction)mcAction
{
  return self->_mcAction;
}

- (id)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (void)setResolvedTarget:(id)a3
{
}

- (NSMutableDictionary)states
{
  return self->_states;
}

- (void)setStates:(id)a3
{
}

- (double)time
{
  return self->_time;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
}

- (id)specificObject
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setSpecificObject:(id)a3
{
}

- (NSString)targetPath
{
  return self->_targetPath;
}

- (void)setTargetPath:(id)a3
{
}

@end