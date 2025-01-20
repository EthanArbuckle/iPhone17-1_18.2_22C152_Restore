@interface PRUISAnalysisServiceRequest
+ (BOOL)supportsSecureCoding;
- (NSSet)requestedAnalyses;
- (NSString)description;
- (NSUUID)requestIdentifier;
- (PBUICodableImage)image;
- (PRUISAnalysisServiceRequest)initWithCoder:(id)a3;
- (PRUISAnalysisServiceRequest)initWithImage:(id)a3 analyses:(id)a4;
- (PRUISAnalysisServiceRequest)initWithImage:(id)a3 analyses:(id)a4 requestIdentifier:(id)a5;
- (PRUISAnalysisServiceRequest)initWithImage:(id)a3 analysis:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRUISAnalysisServiceRequest

- (PRUISAnalysisServiceRequest)initWithImage:(id)a3 analyses:(id)a4
{
  v6 = (void *)MEMORY[0x263F08C38];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 UUID];
  v10 = [(PRUISAnalysisServiceRequest *)self initWithImage:v8 analyses:v7 requestIdentifier:v9];

  return v10;
}

- (PRUISAnalysisServiceRequest)initWithImage:(id)a3 analysis:(id)a4
{
  v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = a3;
  id v8 = [v6 setWithObject:a4];
  v9 = [(PRUISAnalysisServiceRequest *)self initWithImage:v7 analyses:v8];

  return v9;
}

- (PRUISAnalysisServiceRequest)initWithImage:(id)a3 analyses:(id)a4 requestIdentifier:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PRUISAnalysisServiceRequest.m", 34, @"Invalid parameter not satisfying: %@", @"image" object file lineNumber description];
  }
  if ([v11 count])
  {
    if (v12) {
      goto LABEL_5;
    }
  }
  else
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PRUISAnalysisServiceRequest.m", 35, @"Invalid parameter not satisfying: %@", @"[analyses count] > 0" object file lineNumber description];

    if (v12) {
      goto LABEL_5;
    }
  }
  v18 = [MEMORY[0x263F08690] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"PRUISAnalysisServiceRequest.m", 36, @"Invalid parameter not satisfying: %@", @"requestIdentifier" object file lineNumber description];

LABEL_5:
  v19.receiver = self;
  v19.super_class = (Class)PRUISAnalysisServiceRequest;
  v13 = [(PRUISAnalysisServiceRequest *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_requestIdentifier, a5);
    objc_storeStrong((id *)&v14->_requestedAnalyses, a4);
    objc_storeStrong((id *)&v14->_image, a3);
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  image = self->_image;
  id v5 = a3;
  [v5 encodeObject:image forKey:@"_image"];
  [v5 encodeObject:self->_requestIdentifier forKey:@"_requestIdentifier"];
  v6 = [(NSSet *)self->_requestedAnalyses allObjects];
  id v7 = [v6 componentsJoinedByString:@"%%"];

  [v5 encodeObject:v7 forKey:@"_requestedAnalyses"];
}

- (PRUISAnalysisServiceRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  v6 = [v4 decodeObjectOfClass:v5 forKey:@"_image"];

  id v7 = self;
  id v8 = [v4 decodeObjectOfClass:v7 forKey:@"_requestIdentifier"];

  v9 = self;
  id v10 = [v4 decodeObjectOfClass:v9 forKey:@"_requestedAnalyses"];

  id v11 = [v10 componentsSeparatedByString:@"%%"];
  id v12 = [MEMORY[0x263EFFA08] setWithArray:v11];
  v13 = [(PRUISAnalysisServiceRequest *)self initWithImage:v6 analyses:v12 requestIdentifier:v8];

  return v13;
}

- (NSString)description
{
  return (NSString *)[(PRUISAnalysisServiceRequest *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(PRUISAnalysisServiceRequest *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x263F29C40];
  id v5 = a3;
  v6 = [v4 builderWithObject:self];
  id v7 = (id)[v6 appendObject:self->_requestIdentifier withName:@"_requestIdentifier"];
  id v8 = [(PRUISAnalysisServiceRequest *)self requestedAnalyses];
  v9 = [v8 allObjects];
  [v6 appendArraySection:v9 withName:@"requestedAnalyses" multilinePrefix:v5 skipIfEmpty:0];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__PRUISAnalysisServiceRequest_descriptionBuilderWithMultilinePrefix___block_invoke;
  v13[3] = &unk_26546B148;
  id v10 = v6;
  id v14 = v10;
  v15 = self;
  [v10 appendBodySectionWithName:@"Payload" multilinePrefix:v5 block:v13];

  id v11 = v10;
  return v11;
}

void __69__PRUISAnalysisServiceRequest_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) image];
  id v2 = (id)[v1 appendObject:v3 withName:@"_image"];
}

- (id)succinctDescription
{
  id v2 = [(PRUISAnalysisServiceRequest *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x263F29C40] builderWithObject:self];
}

- (PBUICodableImage)image
{
  return self->_image;
}

- (NSSet)requestedAnalyses
{
  return self->_requestedAnalyses;
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_requestedAnalyses, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end