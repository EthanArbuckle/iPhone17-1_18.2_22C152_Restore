@interface AFBBufferBuilder(TRIFBBoxedDouble)
- (id)trifbCreateBoxedDoubleFromBoxedDouble:()TRIFBBoxedDouble;
- (id)trifbCreateVectorOfBoxedDoubleFromArray:()TRIFBBoxedDouble;
- (id)trifbCreateVectorOfBoxedDoubleWithCount:()TRIFBBoxedDouble block:;
- (uint64_t)trifbCreateVectorOfBoxedDoubleFromArray:()TRIFBBoxedDouble;
- (uint64_t)trifbCreateVectorOfBoxedDoubleWithCount:()TRIFBBoxedDouble block:;
- (void)trifbCreateVectorOfBoxedDoubleFromArray:()TRIFBBoxedDouble;
- (void)trifbCreateVectorOfBoxedDoubleWithCount:()TRIFBBoxedDouble block:;
@end

@implementation AFBBufferBuilder(TRIFBBoxedDouble)

- (id)trifbCreateBoxedDoubleFromBoxedDouble:()TRIFBBoxedDouble
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"TRIFBFastFactorLevels_generated.mm", 5545, @"Invalid parameter not satisfying: %@", @"BoxedDouble" object file lineNumber description];
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

- (id)trifbCreateVectorOfBoxedDoubleFromArray:()TRIFBBoxedDouble
{
  *a2 = &unk_1EEFB6468;
  id result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

- (id)trifbCreateVectorOfBoxedDoubleWithCount:()TRIFBBoxedDouble block:
{
  v14[4] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"TRIFBFastFactorLevels_generated.mm", 5572, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
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
    v14[0] = &unk_1EEFB6570;
    v14[1] = MEMORY[0x19F3AD290](v7);
    v14[3] = v14;
    uint64_t VectorOf = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVectorOfStructs<BoxedDouble>(v10, a3, (uint64_t)v14);
    std::__function::__value_func<void ()(unsigned long,BoxedDouble *)>::~__value_func[abi:ne180100](v14);
    v9 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:VectorOf];
  }

  return v9;
}

- (uint64_t)trifbCreateVectorOfBoxedDoubleFromArray:()TRIFBBoxedDouble
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "Z78-[AFBBufferBuilder(TRIFBBoxedDouble) trifbCreateVectorOfBoxedDoubleFromArray:]E3$_9"
    || ((v3 & (unint64_t)"Z78-[AFBBufferBuilder(TRIFBBoxedDouble) trifbCreateVectorOfBoxedDoubleFromArray:]E3$_9" & 0x8000000000000000) != 0) != __OFSUB__(v3, "Z78-[AFBBufferBuilder(TRIFBBoxedDouble) trifbCreateVectorOfBoxedDoubleFromArray:]E3$_9")
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z78-[AFBBufferBuilder(TRIFBBoxedDouble) trifbCreateVectorOfBoxedDoubleFromArray:]E3$_9" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)trifbCreateVectorOfBoxedDoubleFromArray:()TRIFBBoxedDouble
{
}

- (uint64_t)trifbCreateVectorOfBoxedDoubleWithCount:()TRIFBBoxedDouble block:
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "Z84-[AFBBufferBuilder(TRIFBBoxedDouble) trifbCreateVectorOfBoxedDoubleWithCount:block:]E4$_10"
    || ((v3 & (unint64_t)"Z84-[AFBBufferBuilder(TRIFBBoxedDouble) trifbCreateVectorOfBoxedDoubleWithCount:block:]E4$_10" & 0x8000000000000000) != 0) != __OFSUB__(v3, "Z84-[AFBBufferBuilder(TRIFBBoxedDouble) trifbCreateVectorOfBoxedDoubleWithCount:block:]E4$_10")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z84-[AFBBufferBuilder(TRIFBBoxedDouble) trifbCreateVectorOfBoxedDoubleWithCount:block:]E4$_10" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)trifbCreateVectorOfBoxedDoubleWithCount:()TRIFBBoxedDouble block:
{
}

@end