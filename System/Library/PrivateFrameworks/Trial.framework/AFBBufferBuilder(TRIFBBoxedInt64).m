@interface AFBBufferBuilder(TRIFBBoxedInt64)
- (id)trifbCreateBoxedInt64FromBoxedInt64:()TRIFBBoxedInt64;
- (id)trifbCreateVectorOfBoxedInt64FromArray:()TRIFBBoxedInt64;
- (id)trifbCreateVectorOfBoxedInt64WithCount:()TRIFBBoxedInt64 block:;
- (uint64_t)trifbCreateVectorOfBoxedInt64FromArray:()TRIFBBoxedInt64;
- (uint64_t)trifbCreateVectorOfBoxedInt64WithCount:()TRIFBBoxedInt64 block:;
- (void)trifbCreateVectorOfBoxedInt64FromArray:()TRIFBBoxedInt64;
- (void)trifbCreateVectorOfBoxedInt64WithCount:()TRIFBBoxedInt64 block:;
@end

@implementation AFBBufferBuilder(TRIFBBoxedInt64)

- (id)trifbCreateBoxedInt64FromBoxedInt64:()TRIFBBoxedInt64
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"TRIFBFastFactorLevels_generated.mm", 5305, @"Invalid parameter not satisfying: %@", @"BoxedInt64" object file lineNumber description];
  }
  [a1 throwIfFinalizedWithSelector:a2];
  v6 = [a1 firstError];

  if (v6)
  {
    v7 = &unk_1EEFCBE10;
  }
  else
  {
    v8 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)[a1 fbb];
    v9 = (void *)[v5 cppPointer];
    apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)v8);
    apple::aiml::flatbuffers2::FlatBufferBuilder::Align(v8, 8uLL);
    apple::aiml::flatbuffers2::vector_downward::ensure_space(v8, 8uLL);
    uint64_t v10 = *((void *)v8 + 6);
    *(void *)(v10 - 8) = *v9;
    v10 -= 8;
    *((void *)v8 + 6) = v10;
    v7 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((void *)v8 + 4) - v10 + *((void *)v8 + 5)];
  }

  return v7;
}

- (id)trifbCreateVectorOfBoxedInt64FromArray:()TRIFBBoxedInt64
{
  *a2 = &unk_1EEFB6410;
  id result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

- (id)trifbCreateVectorOfBoxedInt64WithCount:()TRIFBBoxedInt64 block:
{
  v14[4] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"TRIFBFastFactorLevels_generated.mm", 5332, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  [a1 throwIfFinalizedWithSelector:a2];
  v8 = [a1 firstError];

  if (v8)
  {
    v9 = &unk_1EEFCBE10;
  }
  else
  {
    uint64_t v10 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)[a1 fbb];
    v14[0] = &unk_1EEFB6518;
    v14[1] = MEMORY[0x19F3AD290](v7);
    v14[3] = v14;
    uint64_t VectorOf = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVectorOfStructs<BoxedInt64>(v10, a3, (uint64_t)v14);
    std::__function::__value_func<void ()(unsigned long,BoxedInt64 *)>::~__value_func[abi:ne180100](v14);
    v9 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:VectorOf];
  }

  return v9;
}

- (uint64_t)trifbCreateVectorOfBoxedInt64FromArray:()TRIFBBoxedInt64
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "Z76-[AFBBufferBuilder(TRIFBBoxedInt64) trifbCreateVectorOfBoxedInt64FromArray:]E3$_7"
    || ((v3 & (unint64_t)"Z76-[AFBBufferBuilder(TRIFBBoxedInt64) trifbCreateVectorOfBoxedInt64FromArray:]E3$_7" & 0x8000000000000000) != 0) != __OFSUB__(v3, "Z76-[AFBBufferBuilder(TRIFBBoxedInt64) trifbCreateVectorOfBoxedInt64FromArray:]E3$_7")
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z76-[AFBBufferBuilder(TRIFBBoxedInt64) trifbCreateVectorOfBoxedInt64FromArray:]E3$_7" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)trifbCreateVectorOfBoxedInt64FromArray:()TRIFBBoxedInt64
{
}

- (uint64_t)trifbCreateVectorOfBoxedInt64WithCount:()TRIFBBoxedInt64 block:
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "Z82-[AFBBufferBuilder(TRIFBBoxedInt64) trifbCreateVectorOfBoxedInt64WithCount:block:]E3$_8"
    || ((v3 & (unint64_t)"Z82-[AFBBufferBuilder(TRIFBBoxedInt64) trifbCreateVectorOfBoxedInt64WithCount:block:]E3$_8" & 0x8000000000000000) != 0) != __OFSUB__(v3, "Z82-[AFBBufferBuilder(TRIFBBoxedInt64) trifbCreateVectorOfBoxedInt64WithCount:block:]E3$_8")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z82-[AFBBufferBuilder(TRIFBBoxedInt64) trifbCreateVectorOfBoxedInt64WithCount:block:]E3$_8" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)trifbCreateVectorOfBoxedInt64WithCount:()TRIFBBoxedInt64 block:
{
}

@end