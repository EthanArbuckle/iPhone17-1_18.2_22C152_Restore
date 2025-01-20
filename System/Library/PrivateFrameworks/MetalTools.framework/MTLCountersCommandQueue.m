@interface MTLCountersCommandQueue
- (MTLCountersCommandQueue)initWithCommandQueue:(id)a3 device:(id)a4;
- (NSString)tracePath;
- (id)commandBuffer;
- (id)commandBufferWithDescriptor:(id)a3;
- (id)commandBufferWithUnretainedReferences;
@end

@implementation MTLCountersCommandQueue

- (MTLCountersCommandQueue)initWithCommandQueue:(id)a3 device:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v33.receiver = self;
  v33.super_class = (Class)MTLCountersCommandQueue;
  v5 = -[MTLToolsCommandQueue initWithBaseObject:parent:](&v33, sel_initWithBaseObject_parent_, a3);
  if (v5)
  {
    v6 = getenv("MTL_XML_DUMP_COUNTERS");
    if (!v6) {
      v6 = "1";
    }
    uint64_t v7 = strtol(v6, 0, 0);
    v8 = getenv("MTL_XML_SYNC_BEFORE_SAMPLE");
    if (!v8) {
      v8 = "0";
    }
    uint64_t v9 = strtol(v8, 0, 0);
    v10 = (void *)MEMORY[0x23ECD5710]();
    v11 = NSString;
    v12 = getenv("MTL_XML_TRACE_PATH");
    if (v12) {
      v13 = v12;
    }
    else {
      v13 = "";
    }
    v14 = (void *)[v11 stringWithUTF8String:v13];
    v5->_tracePath = (NSString *)(id)objc_msgSend((id)objc_msgSend(v14, "stringByStandardizingPath"), "stringByAppendingPathComponent:", objc_msgSend(NSString, "stringWithFormat:", @"xml_trace_%p", a4));
    id v32 = 0;
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5->_tracePath, 1, 0, &v32) & 1) == 0)NSLog(&cfstr_ErrorCreatingD.isa, v5->_tracePath, objc_msgSend(v32, "localizedDescription")); {
    if (v7)
    }
    {
      [(MTLToolsCommandQueue *)v5 setStatEnabled:1];
      v15 = NSString;
      v16 = getenv("MTL_XML_COUNTER_NAMES");
      if (v16) {
        v17 = v16;
      }
      else {
        v17 = "MTLStat_nSec";
      }
      v18 = objc_msgSend((id)objc_msgSend(v15, "stringWithUTF8String:", v17), "componentsSeparatedByString:", @",");
      id v19 = [(MTLToolsCommandQueue *)v5 availableCounters];
      v20 = objc_opt_new();
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v21 = [v18 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v29 != v23) {
              objc_enumerationMutation(v18);
            }
            uint64_t v25 = *(void *)(*((void *)&v28 + 1) + 8 * i);
            if ([v19 containsObject:v25]) {
              [v20 addObject:v25];
            }
            else {
              NSLog(&cfstr_UnsupportedCou.isa, v25);
            }
          }
          uint64_t v22 = [v18 countByEnumeratingWithState:&v28 objects:v34 count:16];
        }
        while (v22);
      }
      if ([(MTLToolsCommandQueue *)v5 requestCounters:v20]) {
        NSLog(&cfstr_FailedToReques.isa);
      }
      [(MTLToolsCommandQueue *)v5 setStatLocations:63];
      if (v9) {
        [(MTLToolsCommandQueue *)v5 setStatOptions:1];
      }
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __55__MTLCountersCommandQueue_initWithCommandQueue_device___block_invoke;
      v27[3] = &unk_264E12D68;
      v27[4] = v20;
      [(MTLToolsCommandQueue *)v5 addPerfSampleHandler:v27];
    }
  }
  return v5;
}

uint64_t __55__MTLCountersCommandQueue_initWithCommandQueue_device___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v7 = (void *)[a2 traceBuffer];
  uint64_t v8 = [a3 bytes];
  uint64_t v9 = 8 * a4 * [*(id *)(a1 + 32) count];

  return [v7 appendSamples:v8 length:v9];
}

- (id)commandBuffer
{
  v3 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBuffer");
  if (v4)
  {
    v5 = [[MTLCountersCommandBuffer alloc] initWithCommandBuffer:v4 commandQueue:self descriptor:0];
    return v5;
  }
  else
  {
    return 0;
  }
}

- (id)commandBufferWithUnretainedReferences
{
  v3 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBufferWithUnretainedReferences");
  if (v4)
  {
    v5 = [[MTLCountersCommandBuffer alloc] initWithCommandBuffer:v4 commandQueue:self descriptor:0];
    return v5;
  }
  else
  {
    return 0;
  }
}

- (id)commandBufferWithDescriptor:(id)a3
{
  v5 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBufferWithDescriptor:", -[MTLToolsDevice unwrapMTLCommandBufferDescriptor:alwaysCopy:](self->super.super._device, "unwrapMTLCommandBufferDescriptor:alwaysCopy:", a3, 0));
  if (v6)
  {
    uint64_t v7 = [[MTLCountersCommandBuffer alloc] initWithCommandBuffer:v6 commandQueue:self descriptor:a3];
    return v7;
  }
  else
  {
    return 0;
  }
}

- (NSString)tracePath
{
  return self->_tracePath;
}

@end