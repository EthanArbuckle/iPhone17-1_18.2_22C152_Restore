@interface NSMutableDictionary
@end

@implementation NSMutableDictionary

void __86__NSMutableDictionary_OSAStackshotKCDataExtension__addTurnstileInfoDesc_count_elSize___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 8);
  uint64_t v5 = *(unsigned __int8 *)(a3 + 16);
  uint64_t v6 = *(unsigned __int8 *)(a3 + 17);
  uint64_t v7 = *(void *)(a3 + 18);
  uint64_t v8 = *(__int16 *)(a3 + 26);
  v9 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"thread %llu: ", *(void *)a3);
  id v15 = v9;
  if ((v7 & 2) != 0)
  {
    v10 = @"turnstile was in the process of being updated";
  }
  else
  {
    if ((v7 & 4) != 0)
    {
      [v9 appendFormat:@"blocked on workqueue: 0x%llx, hops: %d, priority: %d", v4, v6, v5];
      goto LABEL_13;
    }
    if ((v7 & 8) != 0)
    {
      [v9 appendFormat:@"blocked on %lld, hops: %d, priority: %d", v4, v6, v5];
      goto LABEL_13;
    }
    if (v7)
    {
      v10 = @"turnstile has unknown inheritor";
    }
    else
    {
      if ((v7 & 0x10) == 0)
      {
        objc_msgSend(v9, "appendFormat:", @"turnstile had unknown status (flags: 0x%llx)!", v7, v13, v14);
        goto LABEL_13;
      }
      uint64_t v13 = v6;
      uint64_t v14 = v5;
      uint64_t v12 = v4;
      v10 = @"turnstile blocked on task pid %lld, hops: %d, priority: %d";
    }
  }
  objc_msgSend(v9, "appendFormat:", v10, v12, v13, v14);
LABEL_13:
  if ((v7 & 0xC0) != 0)
  {
    v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"portlabels"];
    [v15 appendPortLabelInfo:v8 portlabels:v11];
  }
  [*(id *)(a1 + 40) addObject:v15];
}

void __81__NSMutableDictionary_OSAStackshotKCDataExtension__addWaitInfoDesc_count_elSize___block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = *((unsigned __int8 *)a3 + 24);
  uint64_t v5 = *(__int16 *)((char *)a3 + 25);
  uint64_t v6 = *a3;
  uint64_t v7 = a3[2];
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"thread %llu: ", a3[1]);
  id v18 = v8;
  switch((int)v4)
  {
    case 1:
      objc_msgSend(v8, "appendFormat:", @"kernel mutex %#llx", v7);
      if (!v6) {
        goto LABEL_27;
      }
      uint64_t v8 = v18;
      if (v6 == -6)
      {
        v9 = @" in spin mode";
        goto LABEL_39;
      }
      objc_msgSend(v18, "appendFormat:", @" owned by thread %llu", v6, v16, v17);
      goto LABEL_40;
    case 2:
      [v8 appendFormat:@"mach_msg receive on "];
      switch(v6)
      {
        case -5:
LABEL_13:
          uint64_t v15 = v7;
          v11 = @"intransit port %#llx";
          goto LABEL_53;
        case 0:
          uint64_t v15 = v7;
          v11 = @"port %#llx";
          goto LABEL_53;
        case -3:
          objc_msgSend(v18, "appendFormat:", @"locked port %#llx", v7, v16);
          break;
        default:
          objc_msgSend(v18, "appendFormat:", @"port %#llx name %#llx", v7, v6);
          break;
      }
      goto LABEL_54;
    case 3:
      v10 = &stru_1EFE17BD0;
      if (v6 == -4) {
        v10 = @"locked ";
      }
      [v8 appendFormat:@"mach_msg receive on %@port set %#llx", v10, v7, v17];
      goto LABEL_40;
    case 4:
      [v8 appendFormat:@"mach_msg send on "];
      switch(v6)
      {
        case -5:
          goto LABEL_13;
        case -3:
          uint64_t v15 = v7;
          v11 = @"locked port %#llx";
          break;
        case -2:
          uint64_t v15 = v7;
          v11 = @"port %#llx owned by kernel";
          break;
        case 0:
          uint64_t v15 = v7;
          v11 = @"port %#llx with unknown owner";
          break;
        default:
          uint64_t v15 = v7;
          uint64_t v16 = v6;
          v11 = @"port %#llx owned by pid %llu";
          break;
      }
LABEL_53:
      objc_msgSend(v18, "appendFormat:", v11, v15, v16);
LABEL_54:
      uint64_t v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"portlabels"];
      [v18 appendPortLabelInfo:v5 portlabels:v13];

      goto LABEL_40;
    case 5:
      objc_msgSend(v8, "appendFormat:", @"mach_msg send on port %#llx in transit to ", v7);
      if (v6)
      {
        uint64_t v14 = v6;
        v9 = @"port %#llx";
      }
      else
      {
        v9 = @"unknown port";
      }
      goto LABEL_38;
    case 6:
      objc_msgSend(v8, "appendFormat:", @"semaphore port %#llx", v7);
      if (!v6) {
        goto LABEL_27;
      }
      uint64_t v14 = v6;
      v9 = @" owned by pid %lld";
      goto LABEL_38;
    case 7:
      objc_msgSend(v8, "appendFormat:", @"krwlock %#llx for reading", v7, v16);
      goto LABEL_24;
    case 8:
      objc_msgSend(v8, "appendFormat:", @"krwlock %#llx for writing", v7, v16);
      goto LABEL_24;
    case 9:
      objc_msgSend(v8, "appendFormat:", @"krwlock %#llx for upgrading", v7, v16);
      goto LABEL_24;
    case 10:
      uint64_t v12 = @"unfair ";
      if (!v6) {
        uint64_t v12 = @"spin";
      }
      [v8 appendFormat:@"%@lock %#llx", v12, v7];
LABEL_24:
      if (v6) {
        goto LABEL_25;
      }
      goto LABEL_40;
    case 11:
      objc_msgSend(v8, "appendFormat:", @"pthread mutex %#llx", v7);
      if (v6)
      {
LABEL_25:
        uint64_t v14 = v6;
        v9 = @" owned by thread %lld";
      }
      else
      {
LABEL_27:
        v9 = @" with unknown owner";
      }
LABEL_38:
      uint64_t v8 = v18;
      goto LABEL_39;
    case 12:
      objc_msgSend(v8, "appendFormat:", @"pthread rwlock %#llx for reading", v7, v16, v17);
      goto LABEL_40;
    case 13:
      objc_msgSend(v8, "appendFormat:", @"pthread rwlock %#llx for writing", v7, v16, v17);
      goto LABEL_40;
    case 14:
      objc_msgSend(v8, "appendFormat:", @"pthread condvar %#llx", v7, v16, v17);
      goto LABEL_40;
    case 16:
      switch(v6)
      {
        case -8:
          v9 = @"queue that is suspended";
          goto LABEL_39;
        case 0:
          v9 = @"queue in a transient state";
          goto LABEL_39;
        case -7:
          v9 = @"queue thread to be allocated";
LABEL_39:
          objc_msgSend(v8, "appendFormat:", v9, v14, v16, v17);
          goto LABEL_40;
      }
      objc_msgSend(v8, "appendFormat:", @"queue processed by thread %llu", v6, v16, v17);
LABEL_40:
      [*(id *)(a1 + 40) addObject:v18];

      return;
    case 20:
      objc_msgSend(v8, "appendFormat:", @"thread %llu in compressor segment %#llx", v6, v7, v17);
      goto LABEL_40;
    default:
      [v8 appendFormat:@"unknown type %u (owner %llu, context %#llx)", v4, v6, v7];
      goto LABEL_40;
  }
}

void __101__NSMutableDictionary_OSALogTrackerExtension__osa_logTracker_trackLogTypes_internal_forOwner_rescan___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  [v3 setCount:0];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  [v3 setOldestDate:v4];

  [v3 setOldestLogPath:0];
  id v5 = [v3 signatures];

  [v5 removeAllObjects];
}

void __101__NSMutableDictionary_OSALogTrackerExtension__osa_logTracker_trackLogTypes_internal_forOwner_rescan___block_invoke_54(uint64_t a1, void *a2)
{
  id v3 = a2;
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  id v17 = v3;
  uint64_t v4 = (const char *)[v17 fileSystemRepresentation];
  ssize_t v5 = getxattr(v4, "LogType", *(void **)(a1 + 64), 0x4FuLL, 0, 0);
  uint64_t v6 = *(unsigned char **)(a1 + 64);
  if (v5 >= 1)
  {
    v6[v5] = 0;
    uint64_t v7 = [NSString stringWithUTF8String:*(void *)(a1 + 64)];
    if ([v7 length])
    {
      ssize_t v8 = getxattr(v4, "Signature", *(void **)(a1 + 64), 0x4FuLL, 0, 0);
      if (v8 < 1)
      {
        v9 = 0;
      }
      else
      {
        *(unsigned char *)(*(void *)(a1 + 64) + v8) = 0;
        v9 = [NSString stringWithUTF8String:*(void *)(a1 + 64)];
      }
      objc_msgSend(*(id *)(a1 + 32), "osa_logTracker_incrementForSubtype_internal:signature:filepath:scan:", v7, v9, v4, 1);
      if (!osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel
        && [*(id *)(a1 + 40) isEqualToString:v7])
      {
        uint64_t v14 = [v17 path];
        uint64_t v15 = [v14 copy];
        uint64_t v16 = (void *)osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel;
        osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel = v15;
      }
      goto LABEL_16;
    }
LABEL_10:
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
LABEL_16:

    goto LABEL_17;
  }
  ssize_t v10 = getxattr(v4, "bug_type", v6, 0x4FuLL, 0, 0);
  if (v10 >= 1)
  {
    *(unsigned char *)(*(void *)(a1 + 64) + v10) = 0;
    uint64_t v7 = [NSString stringWithUTF8String:*(void *)(a1 + 64)];
    if ([v7 length])
    {
      objc_msgSend(*(id *)(a1 + 32), "osa_logTracker_incrementForSubtype_internal:signature:filepath:scan:", v7, 0, v4, 1);
      if (!osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel
        && [*(id *)(a1 + 40) isEqualToString:v7])
      {
        v11 = [v17 path];
        uint64_t v12 = [v11 copy];
        uint64_t v13 = (void *)osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel;
        osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel = v12;
      }
      goto LABEL_16;
    }
    goto LABEL_10;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
LABEL_17:
}

uint64_t __85__NSMutableDictionary_OSALogTrackerExtension__osa_logTracker_getForSubtype_forOwner___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "osa_logTracker_trackLogTypes_internal:forOwner:rescan:", *(void *)(a1 + 40), *(void *)(a1 + 48), 1);
}

@end