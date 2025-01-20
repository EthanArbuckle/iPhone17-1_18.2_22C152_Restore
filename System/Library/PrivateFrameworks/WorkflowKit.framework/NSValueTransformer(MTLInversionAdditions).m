@interface NSValueTransformer(MTLInversionAdditions)
- (id)mtl_invertedTransformer;
@end

@implementation NSValueTransformer(MTLInversionAdditions)

- (id)mtl_invertedTransformer
{
  if (([(id)objc_opt_class() allowsReverseTransformation] & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"NSValueTransformer+MTLInversionAdditions.m", 16, @"Invalid parameter not satisfying: %@", @"self.class.allowsReverseTransformation" object file lineNumber description];
  }
  if ([a1 conformsToProtocol:&unk_1F2327818])
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, a1, @"NSValueTransformer+MTLInversionAdditions.m", 19, @"Invalid parameter not satisfying: %@", @"[self respondsToSelector:@selector(reverseTransformedValue:success:error:)]" object file lineNumber description];
    }
    id v4 = a1;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __68__NSValueTransformer_MTLInversionAdditions__mtl_invertedTransformer__block_invoke;
    v14[3] = &unk_1E6553460;
    id v15 = v4;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __68__NSValueTransformer_MTLInversionAdditions__mtl_invertedTransformer__block_invoke_2;
    v12[3] = &unk_1E6553460;
    id v13 = v15;
    id v5 = v15;
    v6 = +[MTLValueTransformer transformerUsingForwardBlock:v14 reverseBlock:v12];
  }
  else
  {
    v10[4] = a1;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__NSValueTransformer_MTLInversionAdditions__mtl_invertedTransformer__block_invoke_3;
    v11[3] = &unk_1E6553460;
    v11[4] = a1;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__NSValueTransformer_MTLInversionAdditions__mtl_invertedTransformer__block_invoke_4;
    v10[3] = &unk_1E6553460;
    v6 = +[MTLValueTransformer transformerUsingForwardBlock:v11 reverseBlock:v10];
  }
  return v6;
}

@end