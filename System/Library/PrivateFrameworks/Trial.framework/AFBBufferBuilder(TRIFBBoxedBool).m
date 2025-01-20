@interface AFBBufferBuilder(TRIFBBoxedBool)
- (id)trifbCreateBoxedBoolFromBoxedBool:()TRIFBBoxedBool;
- (id)trifbCreateVectorOfBoxedBoolFromArray:()TRIFBBoxedBool;
- (id)trifbCreateVectorOfBoxedBoolWithCount:()TRIFBBoxedBool block:;
- (uint64_t)trifbCreateVectorOfBoxedBoolFromArray:()TRIFBBoxedBool;
- (uint64_t)trifbCreateVectorOfBoxedBoolWithCount:()TRIFBBoxedBool block:;
- (void)trifbCreateVectorOfBoxedBoolFromArray:()TRIFBBoxedBool;
- (void)trifbCreateVectorOfBoxedBoolWithCount:()TRIFBBoxedBool block:;
@end

@implementation AFBBufferBuilder(TRIFBBoxedBool)

- (id)trifbCreateBoxedBoolFromBoxedBool:()TRIFBBoxedBool
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"TRIFBFastFactorLevels_generated.mm", 5065, @"Invalid parameter not satisfying: %@", @"BoxedBool" object file lineNumber description];
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
    v9 = (unsigned char *)[v5 cppPointer];
    apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)v8);
    apple::aiml::flatbuffers2::FlatBufferBuilder::Align(v8, 1uLL);
    apple::aiml::flatbuffers2::vector_downward::ensure_space(v8, 1uLL);
    uint64_t v10 = *((void *)v8 + 6);
    *((void *)v8 + 6) = v10 - 1;
    *(unsigned char *)(v10 - 1) = *v9;
    v7 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((void *)v8 + 4)- *((void *)v8 + 6)+ *((void *)v8 + 5)];
  }

  return v7;
}

- (id)trifbCreateVectorOfBoxedBoolFromArray:()TRIFBBoxedBool
{
  *a2 = &unk_1EEFB63B8;
  id result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

- (id)trifbCreateVectorOfBoxedBoolWithCount:()TRIFBBoxedBool block:
{
  v14[4] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"TRIFBFastFactorLevels_generated.mm", 5092, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
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
    v14[0] = &unk_1EEFB64C0;
    v14[1] = MEMORY[0x19F3AD290](v7);
    v14[3] = v14;
    uint64_t VectorOf = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVectorOfStructs<BoxedBool>(v10, a3, (uint64_t)v14);
    std::__function::__value_func<void ()(unsigned long,BoxedBool *)>::~__value_func[abi:ne180100](v14);
    v9 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:VectorOf];
  }

  return v9;
}

- (uint64_t)trifbCreateVectorOfBoxedBoolFromArray:()TRIFBBoxedBool
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "Z74-[AFBBufferBuilder(TRIFBBoxedBool) trifbCreateVectorOfBoxedBoolFromArray:]E3$_5"
    || ((v3 & (unint64_t)"Z74-[AFBBufferBuilder(TRIFBBoxedBool) trifbCreateVectorOfBoxedBoolFromArray:]E3$_5" & 0x8000000000000000) != 0) != __OFSUB__(v3, "Z74-[AFBBufferBuilder(TRIFBBoxedBool) trifbCreateVectorOfBoxedBoolFromArray:]E3$_5")
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z74-[AFBBufferBuilder(TRIFBBoxedBool) trifbCreateVectorOfBoxedBoolFromArray:]E3$_5" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)trifbCreateVectorOfBoxedBoolFromArray:()TRIFBBoxedBool
{
}

- (uint64_t)trifbCreateVectorOfBoxedBoolWithCount:()TRIFBBoxedBool block:
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "Z80-[AFBBufferBuilder(TRIFBBoxedBool) trifbCreateVectorOfBoxedBoolWithCount:block:]E3$_6"
    || ((v3 & (unint64_t)"Z80-[AFBBufferBuilder(TRIFBBoxedBool) trifbCreateVectorOfBoxedBoolWithCount:block:]E3$_6" & 0x8000000000000000) != 0) != __OFSUB__(v3, "Z80-[AFBBufferBuilder(TRIFBBoxedBool) trifbCreateVectorOfBoxedBoolWithCount:block:]E3$_6")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z80-[AFBBufferBuilder(TRIFBBoxedBool) trifbCreateVectorOfBoxedBoolWithCount:block:]E3$_6" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)trifbCreateVectorOfBoxedBoolWithCount:()TRIFBBoxedBool block:
{
}

@end