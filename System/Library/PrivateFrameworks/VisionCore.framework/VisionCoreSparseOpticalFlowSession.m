@interface VisionCoreSparseOpticalFlowSession
- (MTLTexture)texture;
- (NSMutableArray)groupingMemoryQuadIDs;
- (NSMutableArray)trackedQuads;
- (NSMutableDictionary)tQuadsTfx;
- (VisionCoreLKTSparseGPU)lktSparseGPUContext;
- (VisionCoreMetalContext)mtlContext;
- (VisionCoreSparseOpticalFlowResult)debuggingMemoryResult;
- (VisionCoreSparseOpticalFlowResult)debuggingResult;
- (VisionCoreSparseOpticalFlowSession)init;
- (__CVBuffer)prevFrame;
- (__n128)sceneHomography;
- (__n128)setSceneHomography:(__n128)a3;
- (id).cxx_construct;
- (int)findClosestQuadIndex:(int)a3 candidateIndices:()vector<int;
- (unint64_t)frameCountSinceLastGrouping;
- (unint64_t)updateKeypointsWithOpticalFlowResultsSourceBuffer:(VisionCoreSparseOpticalFlowSession *)self destBuffer:(SEL)a2 matchBuffer:matchCount:;
- (void)allDstPoints;
- (void)allSrcPoints;
- (void)dealloc;
- (void)groupingMemoryDstPoints;
- (void)groupingMemoryQuadPointsCounts;
- (void)groupingMemorySrcPoints;
- (void)moveMemoryKeypointsToSessionKpts;
- (void)quadPointCounts;
- (void)resetGroupingMemory;
- (void)saveCurrentMatchingToMemoryMatchCounts:(vector<unsigned)long;
- (void)setAllDstPoints:(void *)a3;
- (void)setAllSrcPoints:(void *)a3;
- (void)setDebuggingMemoryResult:(id)a3;
- (void)setDebuggingResult:(id)a3;
- (void)setFrameCountSinceLastGrouping:(unint64_t)a3;
- (void)setGroupingMemoryDstPoints:(void *)a3;
- (void)setGroupingMemoryQuadIDs:(id)a3;
- (void)setGroupingMemoryQuadPointsCounts:(void *)a3;
- (void)setGroupingMemorySrcPoints:(void *)a3;
- (void)setLktSparseGPUContext:(id)a3;
- (void)setQuadPointCounts:(void *)a3;
- (void)setTQuadsTfx:(id)a3;
- (void)setTrackedQuads:(id)a3;
- (void)updateMemoryKeypointsWithOpticalFlowResultsSourceBuffer:(VisionCoreSparseOpticalFlowSession *)self destBuffer:(SEL)a2 matchBuffer:start:;
- (void)updateReferenceTexture:(id)a3 frame:(__CVBuffer *)a4;
@end

@implementation VisionCoreSparseOpticalFlowSession

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  return self;
}

- (void).cxx_destruct
{
  v3 = *(void **)self->_anon_d0;
  if (v3)
  {
    *(void *)&self->_anon_d0[8] = v3;
    operator delete(v3);
  }
  begin = self->_groupingMemoryQuadPointsCounts.__begin_;
  if (begin)
  {
    self->_groupingMemoryQuadPointsCounts.__end_ = begin;
    operator delete(begin);
  }
  v5 = *(void **)self->_anon_a0;
  if (v5)
  {
    *(void *)&self->_anon_a0[8] = v5;
    operator delete(v5);
  }
  v6 = *(void **)self->_anon_88;
  if (v6)
  {
    *(void *)&self->_anon_88[8] = v6;
    operator delete(v6);
  }
  v7 = self->_quadPointCounts.__begin_;
  if (v7)
  {
    self->_quadPointCounts.__end_ = v7;
    operator delete(v7);
  }
  v8 = *(void **)self->_anon_58;
  if (v8)
  {
    *(void *)&self->_anon_58[8] = v8;
    operator delete(v8);
  }
  objc_storeStrong((id *)&self->_debuggingMemoryResult, 0);
  objc_storeStrong((id *)&self->_debuggingResult, 0);
  objc_storeStrong((id *)&self->_lktSparseGPUContext, 0);
  objc_storeStrong((id *)&self->_groupingMemoryQuadIDs, 0);
  objc_storeStrong((id *)&self->_tQuadsTfx, 0);
  objc_storeStrong((id *)&self->_trackedQuads, 0);
  objc_storeStrong((id *)&self->_texture, 0);
  objc_storeStrong((id *)&self->_mtlContext, 0);
}

- (void)setDebuggingMemoryResult:(id)a3
{
}

- (VisionCoreSparseOpticalFlowResult)debuggingMemoryResult
{
  return self->_debuggingMemoryResult;
}

- (void)setDebuggingResult:(id)a3
{
}

- (VisionCoreSparseOpticalFlowResult)debuggingResult
{
  return self->_debuggingResult;
}

- (void)setFrameCountSinceLastGrouping:(unint64_t)a3
{
  self->_frameCountSinceLastGrouping = a3;
}

- (unint64_t)frameCountSinceLastGrouping
{
  return self->_frameCountSinceLastGrouping;
}

- (void)setLktSparseGPUContext:(id)a3
{
}

- (VisionCoreLKTSparseGPU)lktSparseGPUContext
{
  return (VisionCoreLKTSparseGPU *)objc_getProperty(self, a2, 56, 1);
}

- (void)setGroupingMemoryDstPoints:(void *)a3
{
  anon_d0 = self->_anon_d0;
  if (anon_d0 != a3) {
    std::vector<half>::__assign_with_size[abi:ne180100]<half *,half *>((char *)anon_d0, *(char **)a3, *((void *)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 1);
  }
}

- (void)groupingMemoryDstPoints
{
  return self->_anon_d0;
}

- (void)setGroupingMemoryQuadPointsCounts:(void *)a3
{
  p_groupingMemoryQuadPointsCounts = &self->_groupingMemoryQuadPointsCounts;
  if (p_groupingMemoryQuadPointsCounts != a3) {
    std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>(p_groupingMemoryQuadPointsCounts, *(char **)a3, *((char **)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3);
  }
}

- (void)groupingMemoryQuadPointsCounts
{
  return &self->_groupingMemoryQuadPointsCounts;
}

- (void)setGroupingMemorySrcPoints:(void *)a3
{
  anon_a0 = self->_anon_a0;
  if (anon_a0 != a3) {
    std::vector<half>::__assign_with_size[abi:ne180100]<half *,half *>((char *)anon_a0, *(char **)a3, *((void *)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 1);
  }
}

- (void)groupingMemorySrcPoints
{
  return self->_anon_a0;
}

- (void)setGroupingMemoryQuadIDs:(id)a3
{
}

- (NSMutableArray)groupingMemoryQuadIDs
{
  return self->_groupingMemoryQuadIDs;
}

- (void)setAllDstPoints:(void *)a3
{
  anon_88 = self->_anon_88;
  if (anon_88 != a3) {
    std::vector<half>::__assign_with_size[abi:ne180100]<half *,half *>((char *)anon_88, *(char **)a3, *((void *)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 1);
  }
}

- (void)allDstPoints
{
  return self->_anon_88;
}

- (void)setQuadPointCounts:(void *)a3
{
  p_quadPointCounts = &self->_quadPointCounts;
  if (p_quadPointCounts != a3) {
    std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>(p_quadPointCounts, *(char **)a3, *((char **)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3);
  }
}

- (void)quadPointCounts
{
  return &self->_quadPointCounts;
}

- (void)setAllSrcPoints:(void *)a3
{
  anon_58 = self->_anon_58;
  if (anon_58 != a3) {
    std::vector<half>::__assign_with_size[abi:ne180100]<half *,half *>((char *)anon_58, *(char **)a3, *((void *)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 1);
  }
}

- (void)allSrcPoints
{
  return self->_anon_58;
}

- (void)setTQuadsTfx:(id)a3
{
}

- (NSMutableDictionary)tQuadsTfx
{
  return self->_tQuadsTfx;
}

- (void)setTrackedQuads:(id)a3
{
}

- (NSMutableArray)trackedQuads
{
  return self->_trackedQuads;
}

- (__CVBuffer)prevFrame
{
  return self->_prevFrame;
}

- (MTLTexture)texture
{
  return self->_texture;
}

- (__n128)setSceneHomography:(__n128)a3
{
  result[15] = a2;
  result[16] = a3;
  result[17] = a4;
  return result;
}

- (__n128)sceneHomography
{
  return a1[15];
}

- (void)updateMemoryKeypointsWithOpticalFlowResultsSourceBuffer:(VisionCoreSparseOpticalFlowSession *)self destBuffer:(SEL)a2 matchBuffer:start:
{
  anon_a0 = self->_anon_a0;
  v7 = *(__int16 **)self->_anon_a0;
  *(void *)&self->_anon_d0[8] = *(void *)self->_anon_d0;
  p_groupingMemoryQuadPointsCounts = &self->_groupingMemoryQuadPointsCounts;
  begin = self->_groupingMemoryQuadPointsCounts.__begin_;
  end = self->_groupingMemoryQuadPointsCounts.__end_;
  if (end == begin)
  {
    __p = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v69 = 0;
  }
  else
  {
    v70 = self->_anon_a0;
    v71 = &self->_groupingMemoryQuadPointsCounts;
    unint64_t v72 = 0;
    __p = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    unint64_t v14 = 0;
    unint64_t v15 = 0;
    v16 = (unsigned char *)(v3 + v4);
    v17 = (__int16 *)(v2 + 4 * v4);
    do
    {
      v74 = v11;
      unint64_t v75 = v15;
      if (v15 >= end - begin) {
LABEL_108:
      }
        std::vector<unsigned long>::__throw_out_of_range[abi:ne180100]();
      unint64_t v18 = 0;
      int v76 = 0;
      while (v18 < begin[v15])
      {
        if (*v16)
        {
          __int16 v19 = *v7;
          __int16 v20 = v7[1];
          __int16 v21 = *v17;
          __int16 v22 = v17[1];
          if ((unint64_t)v13 >= v14)
          {
            uint64_t v24 = v13 - v12;
            if (v13 - v12 <= -3) {
              goto LABEL_107;
            }
            uint64_t v25 = v24 >> 1;
            if (v14 - (unint64_t)v12 <= (v24 >> 1) + 1) {
              uint64_t v26 = v25 + 1;
            }
            else {
              uint64_t v26 = v14 - (void)v12;
            }
            if (v14 - (unint64_t)v12 >= 0x7FFFFFFFFFFFFFFELL) {
              uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else {
              uint64_t v27 = v26;
            }
            if (v27) {
              uint64_t v27 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<half>>(v27);
            }
            else {
              uint64_t v28 = 0;
            }
            v29 = (char *)(v27 + 2 * v25);
            *(_WORD *)v29 = v19;
            v23 = v29 + 2;
            while (v13 != v12)
            {
              __int16 v30 = *((_WORD *)v13 - 1);
              v13 -= 2;
              *((_WORD *)v29 - 1) = v30;
              v29 -= 2;
            }
            unint64_t v14 = v27 + 2 * v28;
            if (v12) {
              operator delete(v12);
            }
            v12 = v29;
          }
          else
          {
            *(_WORD *)v13 = v19;
            v23 = v13 + 2;
          }
          if ((unint64_t)v23 >= v14)
          {
            uint64_t v31 = v23 - v12;
            if (v23 - v12 < -2) {
              goto LABEL_107;
            }
            uint64_t v32 = v31 >> 1;
            if (v14 - (unint64_t)v12 <= (v31 >> 1) + 1) {
              uint64_t v33 = v32 + 1;
            }
            else {
              uint64_t v33 = v14 - (void)v12;
            }
            if (v14 - (unint64_t)v12 >= 0x7FFFFFFFFFFFFFFELL) {
              uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else {
              uint64_t v34 = v33;
            }
            if (v34) {
              uint64_t v34 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<half>>(v34);
            }
            else {
              uint64_t v35 = 0;
            }
            v36 = (char *)(v34 + 2 * v32);
            *(_WORD *)v36 = v20;
            v13 = v36 + 2;
            while (v23 != v12)
            {
              __int16 v37 = *((_WORD *)v23 - 1);
              v23 -= 2;
              *((_WORD *)v36 - 1) = v37;
              v36 -= 2;
            }
            unint64_t v14 = v34 + 2 * v35;
            if (v12) {
              operator delete(v12);
            }
            v12 = v36;
          }
          else
          {
            *(_WORD *)v23 = v20;
            v13 = v23 + 2;
          }
          v39 = *(char **)&self->_anon_d0[8];
          unint64_t v38 = *(void *)&self->_anon_d0[16];
          if ((unint64_t)v39 >= v38)
          {
            v41 = *(unsigned char **)self->_anon_d0;
            uint64_t v42 = v39 - v41;
            if (v39 - v41 < -2) {
              goto LABEL_107;
            }
            uint64_t v43 = v42 >> 1;
            unint64_t v44 = v38 - (void)v41;
            if (v44 <= (v42 >> 1) + 1) {
              unint64_t v45 = v43 + 1;
            }
            else {
              unint64_t v45 = v44;
            }
            BOOL v46 = v44 >= 0x7FFFFFFFFFFFFFFELL;
            uint64_t v47 = 0x7FFFFFFFFFFFFFFFLL;
            if (!v46) {
              uint64_t v47 = v45;
            }
            if (v47)
            {
              uint64_t v47 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<half>>(v47);
              v41 = *(unsigned char **)self->_anon_d0;
              v39 = *(char **)&self->_anon_d0[8];
            }
            else
            {
              uint64_t v48 = 0;
            }
            v49 = (_WORD *)(v47 + 2 * v43);
            _WORD *v49 = v21;
            v40 = (char *)(v49 + 1);
            while (v39 != v41)
            {
              __int16 v50 = *((_WORD *)v39 - 1);
              v39 -= 2;
              *--v49 = v50;
            }
            unint64_t v38 = v47 + 2 * v48;
            *(void *)self->_anon_d0 = v49;
            *(void *)&self->_anon_d0[8] = v40;
            *(void *)&self->_anon_d0[16] = v38;
            if (v41)
            {
              operator delete(v41);
              unint64_t v38 = *(void *)&self->_anon_d0[16];
            }
          }
          else
          {
            *(_WORD *)v39 = v21;
            v40 = v39 + 2;
          }
          *(void *)&self->_anon_d0[8] = v40;
          if ((unint64_t)v40 >= v38)
          {
            v52 = *(char **)self->_anon_d0;
            uint64_t v53 = v40 - v52;
            if (v40 - v52 < -2) {
LABEL_107:
            }
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            uint64_t v54 = v53 >> 1;
            unint64_t v55 = v38 - (void)v52;
            if (v55 <= (v53 >> 1) + 1) {
              unint64_t v56 = v54 + 1;
            }
            else {
              unint64_t v56 = v55;
            }
            BOOL v46 = v55 >= 0x7FFFFFFFFFFFFFFELL;
            uint64_t v57 = 0x7FFFFFFFFFFFFFFFLL;
            if (!v46) {
              uint64_t v57 = v56;
            }
            if (v57)
            {
              uint64_t v57 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<half>>(v57);
              v52 = *(char **)self->_anon_d0;
              v40 = *(char **)&self->_anon_d0[8];
            }
            else
            {
              uint64_t v58 = 0;
            }
            v59 = (_WORD *)(v57 + 2 * v54);
            _WORD *v59 = v22;
            v51 = v59 + 1;
            while (v40 != v52)
            {
              __int16 v60 = *((_WORD *)v40 - 1);
              v40 -= 2;
              *--v59 = v60;
            }
            *(void *)self->_anon_d0 = v59;
            *(void *)&self->_anon_d0[8] = v51;
            *(void *)&self->_anon_d0[16] = v57 + 2 * v58;
            if (v52) {
              operator delete(v52);
            }
          }
          else
          {
            *(_WORD *)v40 = v22;
            v51 = v40 + 2;
          }
          *(void *)&self->_anon_d0[8] = v51;
          ++v76;
          begin = self->_groupingMemoryQuadPointsCounts.__begin_;
          end = self->_groupingMemoryQuadPointsCounts.__end_;
        }
        ++v18;
        v7 += 2;
        v17 += 2;
        ++v16;
        unint64_t v15 = v75;
        if (v75 >= end - begin) {
          goto LABEL_108;
        }
      }
      if ((unint64_t)v74 >= v72)
      {
        uint64_t v61 = v74 - __p;
        unint64_t v62 = v61 + 1;
        if ((unint64_t)(v61 + 1) >> 61) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        if ((uint64_t)(v72 - (void)__p) >> 2 > v62) {
          unint64_t v62 = (uint64_t)(v72 - (void)__p) >> 2;
        }
        if (v72 - (unint64_t)__p >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v63 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v63 = v62;
        }
        if (v63) {
          unint64_t v63 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v63);
        }
        else {
          uint64_t v64 = 0;
        }
        v65 = (void *)(v63 + 8 * v61);
        void *v65 = v76;
        v11 = v65 + 1;
        if (v74 == __p)
        {
          v66 = __p;
        }
        else
        {
          v66 = __p;
          v67 = v74;
          do
          {
            uint64_t v68 = *--v67;
            *--v65 = v68;
          }
          while (v67 != __p);
        }
        unint64_t v72 = v63 + 8 * v64;
        if (v66) {
          operator delete(v66);
        }
        __p = v65;
      }
      else
      {
        void *v74 = v76;
        v11 = v74 + 1;
      }
      begin = self->_groupingMemoryQuadPointsCounts.__begin_;
      end = self->_groupingMemoryQuadPointsCounts.__end_;
      unint64_t v15 = v75 + 1;
    }
    while (v75 + 1 < end - begin);
    anon_a0 = v70;
    p_groupingMemoryQuadPointsCounts = v71;
    v7 = *(__int16 **)v70;
    v69 = v12;
    end = self->_groupingMemoryQuadPointsCounts.__begin_;
  }
  *(void *)&self->_anon_a0[8] = v7;
  self->_groupingMemoryQuadPointsCounts.__end_ = end;
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<half *>,std::__wrap_iter<half *>,std::back_insert_iterator<std::vector<half>>,0>(v69, v13, (uint64_t)anon_a0);
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<unsigned long *>,std::__wrap_iter<unsigned long *>,std::back_insert_iterator<std::vector<unsigned long>>,0>(__p, v11, (uint64_t)p_groupingMemoryQuadPointsCounts);
  if (v12) {
    operator delete(v12);
  }
  if (__p)
  {
    operator delete(__p);
  }
}

- (unint64_t)updateKeypointsWithOpticalFlowResultsSourceBuffer:(VisionCoreSparseOpticalFlowSession *)self destBuffer:(SEL)a2 matchBuffer:matchCount:
{
  begin = self->_quadPointCounts.__begin_;
  *(void *)&self->_anon_58[8] = *(void *)self->_anon_58;
  *(void *)&self->_anon_88[8] = *(void *)self->_anon_88;
  p_quadPointCounts = &self->_quadPointCounts;
  uint64_t v79 = v5;
  end = self->_quadPointCounts.__end_;
  if (end == begin)
  {
    unint64_t v12 = 0;
    begin = self->_quadPointCounts.__end_;
  }
  else
  {
    v9 = v4;
    v10 = v3;
    v11 = v2;
    unint64_t v12 = 0;
    unint64_t v13 = 0;
    do
    {
      if (v13 >= end - begin) {
LABEL_96:
      }
        std::vector<unsigned long>::__throw_out_of_range[abi:ne180100]();
      unint64_t v14 = 0;
      int v15 = 0;
      while (v14 < begin[v13])
      {
        if (*v9)
        {
          __int16 v16 = *v11;
          __int16 v17 = v11[1];
          __int16 v18 = *v10;
          __int16 v19 = v10[1];
          __int16 v21 = *(char **)&self->_anon_58[8];
          unint64_t v20 = *(void *)&self->_anon_58[16];
          if ((unint64_t)v21 >= v20)
          {
            v23 = *(unsigned char **)self->_anon_58;
            uint64_t v24 = v21 - v23;
            if (v21 - v23 <= -3) {
              goto LABEL_95;
            }
            uint64_t v25 = v24 >> 1;
            unint64_t v26 = v20 - (void)v23;
            if (v26 <= (v24 >> 1) + 1) {
              unint64_t v27 = v25 + 1;
            }
            else {
              unint64_t v27 = v26;
            }
            BOOL v28 = v26 >= 0x7FFFFFFFFFFFFFFELL;
            uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
            if (!v28) {
              uint64_t v29 = v27;
            }
            if (v29)
            {
              uint64_t v29 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<half>>(v29);
              v23 = *(unsigned char **)self->_anon_58;
              __int16 v21 = *(char **)&self->_anon_58[8];
            }
            else
            {
              uint64_t v30 = 0;
            }
            uint64_t v31 = (_WORD *)(v29 + 2 * v25);
            *uint64_t v31 = v16;
            __int16 v22 = (char *)(v31 + 1);
            while (v21 != v23)
            {
              __int16 v32 = *((_WORD *)v21 - 1);
              v21 -= 2;
              *--uint64_t v31 = v32;
            }
            unint64_t v20 = v29 + 2 * v30;
            *(void *)self->_anon_58 = v31;
            *(void *)&self->_anon_58[8] = v22;
            *(void *)&self->_anon_58[16] = v20;
            if (v23)
            {
              operator delete(v23);
              unint64_t v20 = *(void *)&self->_anon_58[16];
            }
          }
          else
          {
            *(_WORD *)__int16 v21 = v16;
            __int16 v22 = v21 + 2;
          }
          *(void *)&self->_anon_58[8] = v22;
          if ((unint64_t)v22 >= v20)
          {
            uint64_t v34 = *(char **)self->_anon_58;
            uint64_t v35 = v22 - v34;
            if (v22 - v34 <= -3) {
              goto LABEL_95;
            }
            uint64_t v36 = v35 >> 1;
            unint64_t v37 = v20 - (void)v34;
            if (v37 <= (v35 >> 1) + 1) {
              unint64_t v38 = v36 + 1;
            }
            else {
              unint64_t v38 = v37;
            }
            BOOL v28 = v37 >= 0x7FFFFFFFFFFFFFFELL;
            uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
            if (!v28) {
              uint64_t v39 = v38;
            }
            if (v39)
            {
              uint64_t v39 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<half>>(v39);
              uint64_t v34 = *(char **)self->_anon_58;
              __int16 v22 = *(char **)&self->_anon_58[8];
            }
            else
            {
              uint64_t v40 = 0;
            }
            v41 = (_WORD *)(v39 + 2 * v36);
            _WORD *v41 = v17;
            uint64_t v33 = v41 + 1;
            while (v22 != v34)
            {
              __int16 v42 = *((_WORD *)v22 - 1);
              v22 -= 2;
              *--v41 = v42;
            }
            *(void *)self->_anon_58 = v41;
            *(void *)&self->_anon_58[8] = v33;
            *(void *)&self->_anon_58[16] = v39 + 2 * v40;
            if (v34) {
              operator delete(v34);
            }
          }
          else
          {
            *(_WORD *)__int16 v22 = v17;
            uint64_t v33 = v22 + 2;
          }
          *(void *)&self->_anon_58[8] = v33;
          unint64_t v44 = *(char **)&self->_anon_88[8];
          unint64_t v43 = *(void *)&self->_anon_88[16];
          if ((unint64_t)v44 >= v43)
          {
            BOOL v46 = *(unsigned char **)self->_anon_88;
            uint64_t v47 = v44 - v46;
            if (v44 - v46 <= -3) {
              goto LABEL_95;
            }
            uint64_t v48 = v47 >> 1;
            unint64_t v49 = v43 - (void)v46;
            if (v49 <= (v47 >> 1) + 1) {
              unint64_t v50 = v48 + 1;
            }
            else {
              unint64_t v50 = v49;
            }
            BOOL v28 = v49 >= 0x7FFFFFFFFFFFFFFELL;
            uint64_t v51 = 0x7FFFFFFFFFFFFFFFLL;
            if (!v28) {
              uint64_t v51 = v50;
            }
            if (v51)
            {
              uint64_t v51 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<half>>(v51);
              BOOL v46 = *(unsigned char **)self->_anon_88;
              unint64_t v44 = *(char **)&self->_anon_88[8];
            }
            else
            {
              uint64_t v52 = 0;
            }
            uint64_t v53 = (_WORD *)(v51 + 2 * v48);
            *uint64_t v53 = v18;
            unint64_t v45 = (char *)(v53 + 1);
            while (v44 != v46)
            {
              __int16 v54 = *((_WORD *)v44 - 1);
              v44 -= 2;
              *--uint64_t v53 = v54;
            }
            unint64_t v43 = v51 + 2 * v52;
            *(void *)self->_anon_88 = v53;
            *(void *)&self->_anon_88[8] = v45;
            *(void *)&self->_anon_88[16] = v43;
            if (v46)
            {
              operator delete(v46);
              unint64_t v43 = *(void *)&self->_anon_88[16];
            }
          }
          else
          {
            *(_WORD *)unint64_t v44 = v18;
            unint64_t v45 = v44 + 2;
          }
          *(void *)&self->_anon_88[8] = v45;
          if ((unint64_t)v45 >= v43)
          {
            unint64_t v56 = *(char **)self->_anon_88;
            uint64_t v57 = v45 - v56;
            if (v45 - v56 <= -3) {
LABEL_95:
            }
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            uint64_t v58 = v57 >> 1;
            unint64_t v59 = v43 - (void)v56;
            if (v59 <= (v57 >> 1) + 1) {
              unint64_t v60 = v58 + 1;
            }
            else {
              unint64_t v60 = v59;
            }
            BOOL v28 = v59 >= 0x7FFFFFFFFFFFFFFELL;
            uint64_t v61 = 0x7FFFFFFFFFFFFFFFLL;
            if (!v28) {
              uint64_t v61 = v60;
            }
            if (v61)
            {
              uint64_t v61 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<half>>(v61);
              unint64_t v56 = *(char **)self->_anon_88;
              unint64_t v45 = *(char **)&self->_anon_88[8];
            }
            else
            {
              uint64_t v62 = 0;
            }
            unint64_t v63 = (_WORD *)(v61 + 2 * v58);
            *unint64_t v63 = v19;
            unint64_t v55 = v63 + 1;
            while (v45 != v56)
            {
              __int16 v64 = *((_WORD *)v45 - 1);
              v45 -= 2;
              *--unint64_t v63 = v64;
            }
            *(void *)self->_anon_88 = v63;
            *(void *)&self->_anon_88[8] = v55;
            *(void *)&self->_anon_88[16] = v61 + 2 * v62;
            if (v56) {
              operator delete(v56);
            }
          }
          else
          {
            *(_WORD *)unint64_t v45 = v19;
            unint64_t v55 = v45 + 2;
          }
          *(void *)&self->_anon_88[8] = v55;
          ++v15;
          begin = self->_quadPointCounts.__begin_;
          end = self->_quadPointCounts.__end_;
        }
        ++v14;
        v11 += 2;
        v10 += 2;
        ++v9;
        ++v12;
        if (v13 >= end - begin) {
          goto LABEL_96;
        }
      }
      uint64_t v65 = v79;
      v67 = *(void **)(v79 + 8);
      unint64_t v66 = *(void *)(v79 + 16);
      if ((unint64_t)v67 >= v66)
      {
        v69 = *(void **)v79;
        uint64_t v70 = ((uint64_t)v67 - *(void *)v79) >> 3;
        unint64_t v71 = v70 + 1;
        if ((unint64_t)(v70 + 1) >> 61) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v72 = v66 - (void)v69;
        if (v72 >> 2 > v71) {
          unint64_t v71 = v72 >> 2;
        }
        BOOL v28 = (unint64_t)v72 >= 0x7FFFFFFFFFFFFFF8;
        unint64_t v73 = 0x1FFFFFFFFFFFFFFFLL;
        if (!v28) {
          unint64_t v73 = v71;
        }
        if (v73)
        {
          unint64_t v73 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v73);
          v69 = *(void **)v79;
          v67 = *(void **)(v79 + 8);
        }
        else
        {
          uint64_t v74 = 0;
        }
        unint64_t v75 = (void *)(v73 + 8 * v70);
        *unint64_t v75 = v15;
        uint64_t v68 = v75 + 1;
        while (v67 != v69)
        {
          uint64_t v76 = *--v67;
          *--unint64_t v75 = v76;
        }
        *(void *)uint64_t v79 = v75;
        *(void *)(v79 + 8) = v68;
        *(void *)(v79 + 16) = v73 + 8 * v74;
        if (v69) {
          operator delete(v69);
        }
        uint64_t v65 = v79;
      }
      else
      {
        void *v67 = v15;
        uint64_t v68 = v67 + 1;
      }
      *(void *)(v65 + 8) = v68;
      ++v13;
      begin = self->_quadPointCounts.__begin_;
      end = self->_quadPointCounts.__end_;
    }
    while (v13 < end - begin);
  }
  self->_quadPointCounts.__end_ = begin;
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<unsigned long *>,std::__wrap_iter<unsigned long *>,std::back_insert_iterator<std::vector<unsigned long>>,0>(*(void **)v79, *(void **)(v79 + 8), (uint64_t)p_quadPointCounts);
  return v12;
}

- (void)moveMemoryKeypointsToSessionKpts
{
}

- (int)findClosestQuadIndex:(int)a3 candidateIndices:()vector<int
{
  var0 = a4->var0;
  if (a4->var1 == a4->var0) {
    return -1;
  }
  unint64_t v8 = 0;
  uint64_t v9 = a3;
  int v10 = -1;
  double v11 = 1.79769313e308;
  do
  {
    if (var0[v8] != a3)
    {
      unint64_t v12 = -[NSMutableArray objectAtIndexedSubscript:](self->_trackedQuads, "objectAtIndexedSubscript:");
      unint64_t v13 = [(NSMutableArray *)self->_trackedQuads objectAtIndexedSubscript:v9];
      [v12 getEmptyDistanceBetweenCenters:v13];
      double v15 = v14;

      var0 = a4->var0;
      if (v15 < v11)
      {
        int v10 = var0[v8];
        double v11 = v15;
        if (v15 == 0.0) {
          break;
        }
      }
    }
    ++v8;
  }
  while (v8 < a4->var1 - var0);
  return v10;
}

- (void)saveCurrentMatchingToMemoryMatchCounts:(vector<unsigned)long
{
  anon_a0 = self->_anon_a0;
  *(void *)&self->_anon_a0[8] = *(void *)self->_anon_a0;
  anon_d0 = self->_anon_d0;
  *(void *)&self->_anon_d0[8] = *(void *)self->_anon_d0;
  begin = self->_groupingMemoryQuadPointsCounts.__begin_;
  self->_groupingMemoryQuadPointsCounts.__end_ = begin;
  unint64_t v8 = a3->__begin_;
  end = a3->__end_;
  int64_t v9 = (char *)end - (char *)a3->__begin_;
  if (v9 >= 1)
  {
    unint64_t v10 = v9 >> 3;
    uint64_t v11 = (char *)self->_groupingMemoryQuadPointsCounts.__end_cap_.__value_ - (char *)begin;
    if (v9 >> 3 <= v11 >> 3)
    {
      if (v8 != end) {
        memmove(begin, v8, v9);
      }
      self->_groupingMemoryQuadPointsCounts.__end_ = &begin[v10];
    }
    else
    {
      uint64_t v12 = v11 >> 2;
      if (v11 >> 2 <= v10) {
        uint64_t v12 = v9 >> 3;
      }
      if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v13 = v12;
      }
      double v14 = (unint64_t *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v13);
      uint64_t v16 = 0;
      __int16 v17 = &v14[v10];
      do
      {
        v14[v16] = v8[v16];
        ++v16;
      }
      while (v10 != v16);
      __int16 v18 = self->_groupingMemoryQuadPointsCounts.__begin_;
      if (v18 == begin)
      {
        unint64_t v20 = v14;
      }
      else
      {
        __int16 v19 = begin;
        unint64_t v20 = v14;
        do
        {
          unint64_t v21 = *--v19;
          *--unint64_t v20 = v21;
        }
        while (v19 != v18);
      }
      __int16 v22 = &v14[v15];
      v23 = self->_groupingMemoryQuadPointsCounts.__end_;
      int64_t v24 = (char *)v23 - (char *)begin;
      if (v23 != begin) {
        memmove(v17, begin, (char *)v23 - (char *)begin);
      }
      uint64_t v25 = self->_groupingMemoryQuadPointsCounts.__begin_;
      self->_groupingMemoryQuadPointsCounts.__begin_ = v20;
      self->_groupingMemoryQuadPointsCounts.__end_ = (unint64_t *)((char *)v17 + v24);
      self->_groupingMemoryQuadPointsCounts.__end_cap_.__value_ = v22;
      if (v25) {
        operator delete(v25);
      }
    }
  }
  std::vector<half>::__insert_with_size[abi:ne180100]<std::__wrap_iter<half *>,std::__wrap_iter<half *>>((uint64_t)anon_a0, *(char **)&self->_anon_a0[8], *(char **)self->_anon_58, *(char **)&self->_anon_58[8], (uint64_t)(*(void *)&self->_anon_58[8] - *(void *)self->_anon_58) >> 1);
  unint64_t v26 = *(char **)&self->_anon_d0[8];
  unint64_t v27 = *(char **)self->_anon_88;
  BOOL v28 = *(char **)&self->_anon_88[8];
  std::vector<half>::__insert_with_size[abi:ne180100]<std::__wrap_iter<half *>,std::__wrap_iter<half *>>((uint64_t)anon_d0, v26, v27, v28, (v28 - v27) >> 1);
}

- (void)resetGroupingMemory
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  *(void *)&self->_anon_d0[8] = *(void *)self->_anon_d0;
  *(void *)&self->_anon_a0[8] = *(void *)self->_anon_a0;
  [(NSMutableArray *)self->_groupingMemoryQuadIDs removeAllObjects];
  self->_groupingMemoryQuadPointsCounts.__end_ = self->_groupingMemoryQuadPointsCounts.__begin_;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_trackedQuads;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        groupingMemoryQuadIDs = self->_groupingMemoryQuadIDs;
        unint64_t v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "UUID", (void)v9);
        [(NSMutableArray *)groupingMemoryQuadIDs addObject:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)updateReferenceTexture:(id)a3 frame:(__CVBuffer *)a4
{
  id v7 = a3;
  CVBufferRelease(self->_prevFrame);
  objc_storeStrong((id *)&self->_texture, a3);
  self->_prevFrame = CVBufferRetain(a4);
}

- (VisionCoreMetalContext)mtlContext
{
  return self->_mtlContext;
}

- (void)dealloc
{
  CVBufferRelease(self->_prevFrame);
  self->_prevFrame = 0;
  v3.receiver = self;
  v3.super_class = (Class)VisionCoreSparseOpticalFlowSession;
  [(VisionCoreSparseOpticalFlowSession *)&v3 dealloc];
}

- (VisionCoreSparseOpticalFlowSession)init
{
  v20.receiver = self;
  v20.super_class = (Class)VisionCoreSparseOpticalFlowSession;
  uint64_t v2 = [(VisionCoreSparseOpticalFlowSession *)&v20 init];
  uint64_t v3 = MEMORY[0x263EF89A0];
  long long v4 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  *(_OWORD *)&v2[1].super.isa = *MEMORY[0x263EF89A0];
  *(_OWORD *)&v2[1]._texture = v4;
  *(_OWORD *)&v2[1]._trackedQuads = *(_OWORD *)(v3 + 32);
  v2->_frameCountSinceLastGrouping = 0;
  uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  groupingMemoryQuadIDs = v2->_groupingMemoryQuadIDs;
  v2->_groupingMemoryQuadIDs = v5;

  lktSparseGPUContext = v2->_lktSparseGPUContext;
  v2->_lktSparseGPUContext = 0;

  id v19 = 0;
  uint64_t v8 = +[VisionCoreMetalContext metalContextAndReturnError:&v19];
  id v9 = v19;
  mtlContext = v2->_mtlContext;
  v2->_mtlContext = (VisionCoreMetalContext *)v8;

  if (v9 || !v2->_mtlContext)
  {
    VisionCoreValidatedLog(4, @"MTL Context creation failed with error %@", v11, v12, v13, v14, v15, v16, (uint64_t)v9);

    __int16 v17 = 0;
  }
  else
  {
    __int16 v17 = v2;
  }

  return v17;
}

@end