@interface UIDynamicButton
@end

@implementation UIDynamicButton

uint64_t __63___UIDynamicButton__appendProemDescriptionSansSelfToFormatter___block_invoke(uint64_t a1, void *a2)
{
  return [a2 appendFormat:@"{%.*g, %.*g}", 3, *(void *)(*(void *)(a1 + 32) + 136), 3, *(void *)(*(void *)(a1 + 32) + 144)];
}

uint64_t __63___UIDynamicButton__appendProemDescriptionSansSelfToFormatter___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 appendFormat:@"{%.*g, %.*g}", 3, *(void *)(*(void *)(a1 + 32) + 152), 3, *(void *)(*(void *)(a1 + 32) + 160)];
}

uint64_t __59___UIDynamicButton__appendDebugBodyDescriptionToFormatter___block_invoke(uint64_t a1, void *a2)
{
  return [a2 appendFormat:@"{%.*g, %.*g}", 3, *(void *)(*(void *)(a1 + 32) + 136), 3, *(void *)(*(void *)(a1 + 32) + 144)];
}

uint64_t __59___UIDynamicButton__appendDebugBodyDescriptionToFormatter___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 appendFormat:@"{%.*g, %.*g}", 3, *(void *)(*(void *)(a1 + 32) + 152), 3, *(void *)(*(void *)(a1 + 32) + 160)];
}

uint64_t __49___UIDynamicButton_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  return -[_UIDynamicButton _appendProemDescriptionSansSelfToFormatter:](*(void *)(a1 + 32), *(void **)(a1 + 40));
}

uint64_t __52___UIDynamicButton__appendDebugDescriptionToStream___block_invoke(uint64_t result)
{
  v1 = *(unint64_t **)(result + 32);
  if (v1)
  {
    v2 = *(void **)(result + 40);
    v3 = _NSStringFromUIPhysicalButton(v1[3]);
    [v2 appendString:v3 withName:@"physicalButton"];

    id v4 = (id)[v2 appendUnsignedInteger:v1[7] withName:@"stage"];
    unint64_t v5 = v1[9];
    if (v5 > 4) {
      v6 = &stru_1ED0E84C0;
    }
    else {
      v6 = off_1E52E0770[v5];
    }
    return [v2 appendString:v6 withName:@"phase"];
  }
  return result;
}

void __52___UIDynamicButton__appendDebugDescriptionToStream___block_invoke_2(uint64_t a1)
{
}

void __58___UIDynamicButton_descriptionBuilderWithMultilinePrefix___block_invoke(int8x16_t *a1)
{
  v2 = (void *)a1[2].i64[0];
  v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58___UIDynamicButton_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  int8x16_t v5 = a1[2];
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

void __58___UIDynamicButton_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
}

@end