@interface GTResourceDownloader
- (GTResourceDownloader)initWithDevice:(id)a3;
- (id)commanndBufferDescriptor;
- (id)downloadQueue;
- (id)getFramebufferPipeline:(unint64_t)a3;
- (id)getGPUBuffer:(unint64_t)a3;
- (id)getGPUBuffer:(unint64_t)a3 context:(id)a4;
- (id)getGPUIndirectCommandBuffer:(id)a3 count:(unint64_t)a4;
- (id)getGPUIndirectCommandBuffer:(unint64_t)a3 context:(id)a4 descriptor:(id)a5;
- (void)_downloadRequest:(apr_array_header_t *)a3 atPoint:(id)a4 dispatchGroup:(id)a5;
- (void)_downloadRequestNew:(apr_array_header_t *)a3 atPoint:(id)a4 dispatchGroup:(id)a5;
- (void)_downloadRequestOld:(apr_array_header_t *)a3 atPoint:(id)a4 dispatchGroup:(id)a5;
- (void)dealloc;
- (void)downloadRequest:(apr_array_header_t *)a3;
- (void)downloadRequest:(apr_array_header_t *)a3 atPoint:(id)a4;
- (void)fillGPUBuffer:(id)a3 size:(unint64_t)a4 context:(id)a5;
@end

@implementation GTResourceDownloader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandBufferDescriptor, 0);
  objc_storeStrong((id *)&self->_downloadQueue, 0);
  objc_storeStrong((id *)&self->_downloadEvent, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
  objc_storeStrong((id *)&self->_pipelineCache, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (void)_downloadRequest:(apr_array_header_t *)a3 atPoint:(id)a4 dispatchGroup:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = v9;
  if (*(unsigned char *)(_sharedCaptureManager + 93)) {
    [(GTResourceDownloader *)self _downloadRequestNew:a3 atPoint:v9 dispatchGroup:v8];
  }
  else {
    [(GTResourceDownloader *)self _downloadRequestOld:a3 atPoint:v9 dispatchGroup:v8];
  }
}

- (void)_downloadRequestNew:(apr_array_header_t *)a3 atPoint:(id)a4 dispatchGroup:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9) {
    dispatch_group_enter(v9);
  }
  v11 = [v8 downloadQueue];
  v12 = [v11 commandBufferWithDescriptor:self->_commandBufferDescriptor];

  v13 = [v8 waitEvent];
  [v12 encodeWaitForEvent:v13 value:[v8 waitValue]];

  DownloadNewArchiveRequests(v12, (uint64_t)a3, _sharedCaptureManager);
  v14 = [v8 downloadEvent];
  [v12 encodeSignalEvent:v14 value:[v8 downloadValue]];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __66__GTResourceDownloader__downloadRequestNew_atPoint_dispatchGroup___block_invoke;
  v16[3] = &unk_222170;
  v15 = v9;
  v17 = v15;
  [v12 addCompletedHandler:v16];
  [v12 commit];
}

void __66__GTResourceDownloader__downloadRequestNew_atPoint_dispatchGroup___block_invoke(uint64_t a1)
{
  v1 = *(NSObject **)(a1 + 32);
  if (v1) {
    dispatch_group_leave(v1);
  }
}

- (void)_downloadRequestOld:(apr_array_header_t *)a3 atPoint:(id)a4 dispatchGroup:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [objc_alloc((Class)MTLSharedEventListener) initWithDispatchQueue:self->_dispatchQueue];
  if (v9) {
    dispatch_group_enter(v9);
  }
  [v8 createContext:a3];
  atomic_fetch_add((atomic_ullong *volatile)&g_resourceCount, a3->nelts);
  v11 = [v8 waitEvent];
  id v12 = [v8 waitValue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __66__GTResourceDownloader__downloadRequestOld_atPoint_dispatchGroup___block_invoke;
  v15[3] = &unk_221F68;
  id v16 = v8;
  v17 = self;
  v18 = v9;
  v13 = v9;
  id v14 = v8;
  [v11 notifyListener:v10 atValue:v12 block:v15];
}

void __66__GTResourceDownloader__downloadRequestOld_atPoint_dispatchGroup___block_invoke(uint64_t a1, void *a2)
{
  id v83 = a2;
  v3 = [*(id *)(a1 + 32) downloadContext];
  v4 = (void **)[v3 requests];
  qsort(v4[3], *((int *)v4 + 3), *((int *)v4 + 2), (int (__cdecl *)(const void *, const void *))GTResourceDownloaderRequest_compareType);
  p_prots = &OBJC_PROTOCOL___MTLDrawable.prots;
  v90 = v3;
  uint64_t v91 = a1;
  if (v4)
  {
    while (*((_DWORD *)v4 + 3))
    {
      uint64_t v7 = *((int *)v4 + 3);
      if (v7)
      {
        id v8 = (char *)v4[3];
        uint64_t v9 = *((int *)v4 + 2);
        uint64_t v10 = v7 - 1;
        *((_DWORD *)v4 + 3) = v10;
        v11 = &v8[v10 * v9];
      }
      else
      {
        v11 = 0;
      }
      os_signpost_id_t v12 = os_signpost_id_make_with_pointer((os_log_t)p_prots[442], v11);
      v13 = p_prots[442];
      id v14 = v13;
      unint64_t v15 = v12 - 1;
      if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&def_CFBEC, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Capture-downloadRequest", (const char *)&unk_21C232, buf, 2u);
      }

      unsigned int v16 = v11[46];
      if (v16 > 0x3B)
      {
        if (v11[46] > 0x52u)
        {
          if (v16 == 83)
          {
            os_signpost_id_t v93 = v12;
            v96 = v6;
            id v89 = *(id *)(a1 + 40);
            id v87 = v3;
            id v60 = *(id *)v11;
            v61 = [v60 functionArray];
            uint64_t v62 = 8 * (void)[v61 count];

            id v85 = [objc_alloc((Class)NSMutableData) initWithLength:v62];
            v63 = [v85 mutableBytes];
            v64 = [v60 functionArray];
            id v65 = [v64 count];

            if (v65)
            {
              unint64_t v66 = 0;
              do
              {
                v67 = [v60 functionArray];
                v68 = [v67 objectAtIndexedSubscript:v66];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v63[v66] = 0;
                }
                else
                {
                  v69 = [v60 functionArray];
                  v70 = [v69 objectAtIndexedSubscript:v66];
                  v71 = DEVICEOBJECT(v70);
                  v63[v66] = v71;
                }
                ++v66;
                v72 = [v60 functionArray];
                id v73 = [v72 count];
              }
              while ((unint64_t)v73 > v66);
            }
            GTResourceDownloaderGetResourceFilename((uint64_t)v11, 0, (char *)buf, 0x80uLL);
            v74 = [v87 objects];
            v75 = +[NSString stringWithUTF8String:buf];
            [v74 addObject:v75];

            v76 = [v87 objects];
            [v76 addObject:v85];

            atomic_fetch_add((atomic_ullong *volatile)&g_GPUDataSize, (unint64_t)[v85 length]);
            v3 = v90;
            a1 = v91;
            p_prots = &OBJC_PROTOCOL___MTLDrawable.prots;
            os_signpost_id_t v12 = v93;
            v6 = v96;
          }
          else if (v16 == 86)
          {
            DownloadIOSurface(*(void **)(a1 + 40), v3, (id *)v11);
          }
        }
        else if (v16 == 60)
        {
          os_signpost_id_t v92 = v12;
          v95 = v6;
          id v88 = *(id *)(a1 + 40);
          id v86 = v3;
          id v31 = *(id *)v11;
          v32 = [v31 functionArray];
          uint64_t v33 = 8 * (void)[v32 count] + 8;

          id v34 = [objc_alloc((Class)NSMutableData) initWithLength:v33];
          v35 = [v31 functionArray];
          id v36 = [v35 count];
          id v37 = v34;
          *(void *)[v37 mutableBytes] = v36;

          id v84 = v37;
          v38 = (char *)[v84 mutableBytes];
          v39 = [v31 functionArray];
          id v40 = [v39 count];

          if (v40)
          {
            unint64_t v41 = 0;
            v42 = v38 + 8;
            do
            {
              v43 = [v31 functionArray];
              v44 = [v43 objectAtIndexedSubscript:v41];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                *(void *)&v42[8 * v41] = 0;
              }
              else
              {
                v45 = [v31 functionArray];
                v46 = [v45 objectAtIndexedSubscript:v41];
                v47 = DEVICEOBJECT(v46);
                *(void *)&v42[8 * v41] = v47;
              }
              ++v41;
              v48 = [v31 functionArray];
              id v49 = [v48 count];
            }
            while ((unint64_t)v49 > v41);
          }
          GTResourceDownloaderGetResourceFilename((uint64_t)v11, 0, (char *)buf, 0x80uLL);
          v50 = [v86 objects];
          v51 = +[NSString stringWithUTF8String:buf];
          [v50 addObject:v51];

          v52 = [v86 objects];
          [v52 addObject:v84];

          atomic_fetch_add((atomic_ullong *volatile)&g_GPUDataSize, (unint64_t)[v84 length]);
          os_signpost_id_t v12 = v92;
          if (objc_opt_respondsToSelector())
          {
            id v53 = [objc_alloc((Class)NSMutableData) initWithLength:256];
            *(void *)[v53 mutableBytes] = 31;
            id v54 = v53;
            uint64_t v55 = 0;
            v56 = (char *)[v54 mutableBytes] + 8;
            do
            {
              *(void *)&v56[8 * v55] = [v31 bufferAddressAtIndex:v55];
              ++v55;
            }
            while (v55 != 31);
            GTResourceDownloaderGetResourceFilename((uint64_t)v11, 1, (char *)buf, 0x80uLL);
            v57 = [v86 objects];
            v58 = +[NSString stringWithUTF8String:buf];
            [v57 addObject:v58];

            v59 = [v86 objects];
            [v59 addObject:v54];

            atomic_fetch_add((atomic_ullong *volatile)&g_GPUDataSize, (unint64_t)[v54 length]);
          }

          v3 = v90;
          a1 = v91;
          p_prots = (__objc2_prot_list **)(&OBJC_PROTOCOL___MTLDrawable + 16);
          v6 = v95;
        }
        else if (v16 == 80)
        {
          DownloadTexture(*(void **)(a1 + 40), v3, (id *)v11, 1);
        }
      }
      else if (v11[46] > 0x31u)
      {
        if (v16 == 50)
        {
          DownloadHeap(*(void **)(a1 + 40), v3, v11);
        }
        else if (v16 == 57)
        {
          id v17 = *(id *)v11;
          id v18 = *(id *)(a1 + 40);
          v94 = v6;
          id v19 = v3;
          id v20 = v17;
          v21 = DEVICEOBJECT(v20);

          id v22 = [v21 size];
          v23 = MakeMTLIndirectCommandBufferDescriptorWithoutResourceIndex((uint64_t)(v11 + 48));
          v24 = [v18 getGPUIndirectCommandBuffer:v22 context:v19 descriptor:v23];

          v25 = [v19 blitCommandEncoder];
          +[NSString stringWithFormat:@"DownloadIndirectCommandBuffer[name=%lu, ref=%llu]", *(void *)v11, *((void *)v11 + 1)];

          v26 = [v19 blitCommandEncoder];
          [v26 copyIndirectCommandBuffer:v21 sourceRange:0 destination:v22 destinationIndex:v24];

          GTResourceDownloaderGetResourceFilename((uint64_t)v11, 0, (char *)buf, 0x80uLL);
          v27 = [v19 objects];
          v28 = +[NSString stringWithUTF8String:buf];
          [v27 addObject:v28];

          v3 = v90;
          v29 = [v19 objects];
          [v29 addObject:v24];

          v30 = [v19 objects];

          v6 = v94;
          [v30 addObject:v23];

          p_prots = (__objc2_prot_list **)(&OBJC_PROTOCOL___MTLDrawable + 16);
          atomic_fetch_add((atomic_ullong *volatile)&g_GPUDataSize, (unint64_t)[v24 allocatedSize]);

          a1 = v91;
        }
      }
      else if (v16 == 16)
      {
        DownloadAccelerationStructure(*(void **)(a1 + 40), v3, v11);
      }
      else if (v16 == 22)
      {
        DownloadBuffer(*(void **)(a1 + 40), v3, v11);
      }
      v77 = p_prots[442];
      v78 = v77;
      if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v77))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&def_CFBEC, v78, OS_SIGNPOST_INTERVAL_END, v12, "Capture-downloadRequest", (const char *)&unk_21C232, buf, 2u);
      }
    }
  }
  atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 40) + 144), -(uint64_t)[v3 usedGPUMemory]);
  [v3 flush];

  id v79 = [*(id *)(a1 + 32) downloadValue];
  v80 = [*(id *)(a1 + 32) downloadEvent];
  [v80 setSignaledValue:v79];

  v81 = *(NSObject **)(a1 + 48);
  if (v81) {
    dispatch_group_leave(v81);
  }
}

- (void)downloadRequest:(apr_array_header_t *)a3 atPoint:(id)a4
{
}

- (void)downloadRequest:(apr_array_header_t *)a3
{
  if (a3->nelts)
  {
    id v5 = (id)objc_opt_new();
    ++self->_downloadValue;
    [v5 setDownloadValue:];
    [v5 setDownloadEvent:self->_downloadEvent];
    [v5 setDownloadQueue:self->_downloadQueue];
    [v5 setWaitValue:0];
    [v5 setWaitEvent:self->_downloadEvent];
    [(GTResourceDownloader *)self _downloadRequest:a3 atPoint:v5 dispatchGroup:self->_dispatchGroup];
  }
}

- (id)commanndBufferDescriptor
{
  return self->_commandBufferDescriptor;
}

- (id)downloadQueue
{
  return self->_downloadQueue;
}

- (id)getFramebufferPipeline:(unint64_t)a3
{
  p_framebufferPipelineMutex = &self->_framebufferPipelineMutex;
  pthread_mutex_lock(&self->_framebufferPipelineMutex);
  pipelineCache = self->_pipelineCache;
  uint64_t v7 = +[NSNumber numberWithUnsignedInteger:a3];
  id v8 = [(NSMutableDictionary *)pipelineCache objectForKey:v7];

  if (!v8)
  {
    device = self->_device;
    id v20 = 0;
    id v10 = -[MTLDeviceSPI newLibraryWithSource:options:error:](device, "newLibraryWithSource:options:error:", @"#include <metal_stdlib>\nusing namespace metal\n;struct VOut { float4 pos [[position]]; float2 uv; };\nvertex VOut Vertex(uint vid [[ vertex_id ]]) {VOut out; out.uv = float2((vid << 1) & 2, vid & 2); out.pos = float4(out.uv * 2.0f + -1.0f, 0.0f, 1.0f); return out; }\nstruct FOut { half4 rt0 [[color(0)]]; };\nfragment FOut Fragment(VOut in [[stage_in]], texture2d<half> tex) { FOut out; out.rt0 = tex.read(uint2(tex.get_width() * (in.uv.x), tex.get_height() * (1.0 - in.uv.y))); return out; }\n",
            0,
            &v20);
    id v19 = v20;
    id v11 = [v10 newFunctionWithName:@"Vertex"];
    id v12 = [v10 newFunctionWithName:@"Fragment"];
    v13 = objc_opt_new();
    [v13 setVertexFunction:v11];
    [v13 setFragmentFunction:v12];
    id v14 = [v13 colorAttachments];
    unint64_t v15 = [v14 objectAtIndexedSubscript:0];
    [v15 setPixelFormat:a3];

    id v8 = [(MTLDeviceSPI *)self->_device newRenderPipelineStateWithDescriptor:v13 error:0];
    unsigned int v16 = self->_pipelineCache;
    id v17 = +[NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v16 setObject:v8 forKeyedSubscript:v17];
  }
  pthread_mutex_unlock(p_framebufferPipelineMutex);

  return v8;
}

- (id)getGPUIndirectCommandBuffer:(unint64_t)a3 context:(id)a4 descriptor:(id)a5
{
  return [(GTResourceDownloader *)self getGPUIndirectCommandBuffer:a5 count:a3];
}

- (id)getGPUBuffer:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  [(GTResourceDownloader *)self fillGPUBuffer:v7 size:a3 context:v6];
  id v8 = [v7 buffer];
  [v6 retainMTLResource:v8];

  return v7;
}

- (id)getGPUIndirectCommandBuffer:(id)a3 count:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(MTLDeviceSPI *)self->_device newIndirectCommandBufferWithDescriptor:v6 maxCommandCount:a4 options:(unint64_t)hideMemory << 18];
  if (!v7)
  {
    if (getGPUIndirectCommandBuffer_count__onceToken != -1) {
      dispatch_once(&getGPUIndirectCommandBuffer_count__onceToken, &__block_literal_global_347);
    }
    id v7 = [(MTLDeviceSPI *)self->_device newIndirectCommandBufferWithDescriptor:v6 maxCommandCount:a4 options:0];
  }

  return v7;
}

void __58__GTResourceDownloader_getGPUIndirectCommandBuffer_count___block_invoke(id a1)
{
  if (s_logUsingOsLog)
  {
    v1 = gt_default_log();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&def_CFBEC, v1, OS_LOG_TYPE_ERROR, "warning: failed to mark GPU indirect buffer memory(GRAPHICS)", buf, 2u);
    }
  }
  else
  {
    v2 = __stderrp;
    id v3 = +[NSString stringWithFormat:@"warning: failed to mark GPU indirect buffer memory(GRAPHICS)"];
    fprintf(v2, "%s\n", (const char *)[v3 UTF8String]);
  }
}

- (id)getGPUBuffer:(unint64_t)a3
{
  id v5 = [[GTDownloadGPUBuffer alloc] initWithTracking:&self->_usedGPUMemory];
  [(GTResourceDownloader *)self fillGPUBuffer:v5 size:a3 context:0];

  return v5;
}

- (void)fillGPUBuffer:(id)a3 size:(unint64_t)a4 context:(id)a5
{
  id v19 = a3;
  id v8 = a5;
  uint64_t v9 = v8;
  unint64_t v10 = (a4 + vm_page_size - 1) & -(uint64_t)vm_page_size;
  if (!self->_maxGPUMemory)
  {
    atomic_store(0, &self->_usedGPUMemory);
    self->_unint64_t maxGPUMemory = 0x8000000;
  }
  unint64_t v11 = atomic_load(&self->_usedGPUMemory);
  if (v11 + v10 > self->_maxGPUMemory)
  {
    if (v8)
    {
      atomic_fetch_add((atomic_ullong *volatile)&self->_usedGPUMemory, -(uint64_t)[v8 usedGPUMemory]);
      [v9 flush];
    }
    while (1)
    {
      unint64_t v13 = atomic_load(&self->_usedGPUMemory);
      unint64_t v14 = v13 + v10;
      unint64_t maxGPUMemory = self->_maxGPUMemory;
      if (v14 <= maxGPUMemory) {
        break;
      }
      if (v10 > maxGPUMemory && !atomic_load(&self->_usedGPUMemory)) {
        break;
      }
      usleep(0x3E8u);
    }
  }
  atomic_fetch_add((atomic_ullong *volatile)&self->_usedGPUMemory, v10);
  if (v9) {
    [v9 setUsedGPUMemory:(char *)[v9 usedGPUMemory] + v10];
  }
  if (v10 <= 8) {
    unint64_t v10 = 8;
  }
  id v16 = [(MTLDeviceSPI *)self->_device newBufferWithLength:v10 options:(unint64_t)hideMemory << 18];
  [v19 setBuffer:v16];

  id v17 = [v19 buffer];

  if (!v17)
  {
    if (fillGPUBuffer_size_context__onceToken != -1) {
      dispatch_once(&fillGPUBuffer_size_context__onceToken, &__block_literal_global_340);
    }
    id v18 = [(MTLDeviceSPI *)self->_device newBufferWithLength:v10 options:0];
    [v19 setBuffer:v18];
  }
  [v19 setSize:v10];
  [v19 setOffset:0];
}

void __51__GTResourceDownloader_fillGPUBuffer_size_context___block_invoke(id a1)
{
  if (s_logUsingOsLog)
  {
    v1 = gt_default_log();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&def_CFBEC, v1, OS_LOG_TYPE_ERROR, "warning: failed to mark GPU buffer memory(GRAPHICS)", buf, 2u);
    }
  }
  else
  {
    v2 = __stderrp;
    id v3 = +[NSString stringWithFormat:@"warning: failed to mark GPU buffer memory(GRAPHICS)"];
    fprintf(v2, "%s\n", (const char *)[v3 UTF8String]);
  }
}

- (void)dealloc
{
  apr_pool_destroy(self->_pool);
  pthread_mutex_destroy(&self->_framebufferPipelineMutex);
  v3.receiver = self;
  v3.super_class = (Class)GTResourceDownloader;
  [(GTResourceDownloader *)&v3 dealloc];
}

- (GTResourceDownloader)initWithDevice:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)GTResourceDownloader;
  id v5 = [(GTResourceDownloader *)&v21 init];
  id v6 = v5;
  if (v5)
  {
    apr_pool_create_ex(&v5->_pool, 0, 0, 0);
    uint64_t v7 = DEVICEOBJECT(v4);
    device = v6->_device;
    v6->_device = (MTLDeviceSPI *)v7;

    uint64_t v9 = (MTLCommandQueue *)[(MTLDeviceSPI *)v6->_device newCommandQueue];
    downloadQueue = v6->_downloadQueue;
    v6->_downloadQueue = v9;

    unint64_t v11 = (MTLCommandBufferDescriptor *)objc_alloc_init((Class)MTLCommandBufferDescriptor);
    commandBufferDescriptor = v6->_commandBufferDescriptor;
    v6->_commandBufferDescriptor = v11;

    if ((qword_2501C8 & 0x100000) != 0) {
      [(MTLCommandBufferDescriptor *)v6->_commandBufferDescriptor setErrorOptions:[(MTLCommandBufferDescriptor *)v6->_commandBufferDescriptor errorOptions] | 1];
    }
    unint64_t v13 = (MTLSharedEvent *)[(MTLDeviceSPI *)v6->_device newSharedEvent];
    downloadEvent = v6->_downloadEvent;
    v6->_downloadEvent = v13;

    v6->_alignment = (unint64_t)[(MTLDeviceSPI *)v6->_device linearTextureAlignmentBytes];
    uint64_t v15 = [v4 dispatchGroup];
    dispatchGroup = v6->_dispatchGroup;
    v6->_dispatchGroup = (OS_dispatch_group *)v15;

    id v17 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.dt.GPUTools.downloader", v17);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v18;

    pthread_mutex_init(&v6->_framebufferPipelineMutex, 0);
  }

  return v6;
}

@end