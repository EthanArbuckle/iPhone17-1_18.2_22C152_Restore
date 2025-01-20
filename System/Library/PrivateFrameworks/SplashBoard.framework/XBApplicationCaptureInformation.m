@interface XBApplicationCaptureInformation
- (NSOrderedSet)launchRequests;
- (NSString)description;
- (XBApplicationCaptureInformation)initWithLaunchRequests:(id)a3 captureInfos:(id)a4 launchImagePaths:(id)a5;
- (id)caarPathForLaunchRequest:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)launchImagePathForLaunchRequest:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)estimatedMemoryImpactForLaunchRequest:(id)a3;
@end

@implementation XBApplicationCaptureInformation

- (XBApplicationCaptureInformation)initWithLaunchRequests:(id)a3 captureInfos:(id)a4 launchImagePaths:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v10 count];
  if (v13 != [v11 count])
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"XBApplicationCaptureInformation.m", 61, @"Invalid parameter not satisfying: %@", @"[launchRequests count] == [captureInfos count]" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)XBApplicationCaptureInformation;
  v14 = [(XBApplicationCaptureInformation *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_launchRequests, a3);
    objc_storeStrong((id *)&v15->_captureInfos, a4);
    objc_storeStrong((id *)&v15->_launchImagePaths, a5);
  }

  return v15;
}

- (unint64_t)estimatedMemoryImpactForLaunchRequest:(id)a3
{
  NSUInteger v4 = [(NSOrderedSet *)self->_launchRequests indexOfObject:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return -1;
  }
  v6 = [(NSArray *)self->_captureInfos objectAtIndexedSubscript:v4];
  unint64_t v7 = [v6 estimatedMemoryImpact];

  return v7;
}

- (id)launchImagePathForLaunchRequest:(id)a3
{
  NSUInteger v4 = [(NSOrderedSet *)self->_launchRequests indexOfObject:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSArray *)self->_launchImagePaths objectAtIndexedSubscript:v4];
  }
  return v5;
}

- (id)caarPathForLaunchRequest:(id)a3
{
  NSUInteger v4 = [(NSOrderedSet *)self->_launchRequests indexOfObject:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v6 = [(NSArray *)self->_captureInfos objectAtIndexedSubscript:v4];
    v5 = [v6 caarFilePath];
  }
  return v5;
}

- (NSString)description
{
  return (NSString *)[(XBApplicationCaptureInformation *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(XBApplicationCaptureInformation *)self descriptionBuilderWithMultilinePrefix:a3];
  NSUInteger v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  NSUInteger v4 = [(XBApplicationCaptureInformation *)self succinctDescriptionBuilder];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = self->_launchRequests;
  uint64_t v5 = [(NSOrderedSet *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = [v9 succinctDescription];
        id v11 = [v4 activeMultilinePrefix];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __73__XBApplicationCaptureInformation_descriptionBuilderWithMultilinePrefix___block_invoke;
        v14[3] = &unk_2646A57C0;
        v14[4] = self;
        v14[5] = v9;
        id v15 = v4;
        [v15 appendBodySectionWithName:v10 multilinePrefix:v11 block:v14];
      }
      uint64_t v6 = [(NSOrderedSet *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v4;
}

void __73__XBApplicationCaptureInformation_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) estimatedMemoryImpactForLaunchRequest:*(void *)(a1 + 40)];
  if (!v2)
  {
    v3 = *(void **)(a1 + 48);
    NSUInteger v4 = @"Minimal";
    goto LABEL_5;
  }
  if (v2 == -1)
  {
    v3 = *(void **)(a1 + 48);
    NSUInteger v4 = @"Undefined!";
LABEL_5:
    [v3 appendString:v4 withName:@"Estimated Memory Impact"];
    goto LABEL_7;
  }
  uint64_t v5 = *(void **)(a1 + 48);
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%zu bytes", objc_msgSend(*(id *)(a1 + 32), "estimatedMemoryImpactForLaunchRequest:", *(void *)(a1 + 40)));
  [v5 appendString:v6 withName:@"Estimated Memory Impact"];

LABEL_7:
  uint64_t v7 = *(void **)(a1 + 48);
  v8 = [*(id *)(a1 + 32) launchImagePathForLaunchRequest:*(void *)(a1 + 40)];
  [v7 appendString:v8 withName:@"Path"];

  v9 = *(void **)(a1 + 48);
  id v10 = [*(id *)(a1 + 32) caarPathForLaunchRequest:*(void *)(a1 + 40)];
  [v9 appendString:v10 withName:@".caar Path" skipIfEmpty:1];
}

- (id)succinctDescription
{
  uint64_t v2 = [(XBApplicationCaptureInformation *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F3F658] builderWithObject:self];
  NSUInteger v4 = [(NSOrderedSet *)self->_launchRequests firstObject];
  uint64_t v5 = [v4 groupID];
  [v3 appendString:v5 withName:@"groupID"];

  id v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSOrderedSet count](self->_launchRequests, "count"), @"launchRequests");
  return v3;
}

- (NSOrderedSet)launchRequests
{
  return self->_launchRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchRequests, 0);
  objc_storeStrong((id *)&self->_launchImagePaths, 0);
  objc_storeStrong((id *)&self->_captureInfos, 0);
}

@end