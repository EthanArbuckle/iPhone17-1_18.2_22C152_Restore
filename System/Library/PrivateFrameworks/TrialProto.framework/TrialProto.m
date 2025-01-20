uint64_t TRIPBGetMessageEnumField(void *a1, void *a2)
{
  int v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "descriptor"), "file"), "syntax");
  v5 = TRIPBGetMessageInt32Field((uint64_t)a1, a2);
  if (v4 == 3)
  {
    if ([a2 isValidEnumValue:v5]) {
      return v5;
    }
    else {
      return 4222467823;
    }
  }
  return v5;
}

uint64_t TRIPBGetMessageInt32Field(uint64_t a1, void *a2)
{
  if (TRIPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16))) {
    return *(unsigned int *)(*(void *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
  }
  else {
    return [a2 defaultValue];
  }
}

void sub_1935CA99C()
{
}

void sub_1935CAD28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t TRIPBCodedInputStreamReadTag(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a1 + 8) || v2 == *(void *)(a1 + 24))
  {
    uint64_t result = 0;
    *(_DWORD *)(a1 + 32) = 0;
  }
  else
  {
    uint64_t result = ReadRawVarint64((uint64_t *)a1);
    *(_DWORD *)(a1 + 32) = result;
    if ((~result & 6) == 0)
    {
      RaiseException(-103, @"Invalid wireformat in tag.");
      uint64_t result = *(unsigned int *)(a1 + 32);
    }
    if (result <= 7)
    {
      RaiseException(-103, @"A zero field number on the wire is invalid.");
      return *(unsigned int *)(a1 + 32);
    }
  }
  return result;
}

uint64_t ReadRawVarint64(uint64_t *a1)
{
  unint64_t v2 = 0;
  uint64_t v3 = 0;
  while (v2 <= 0x3F)
  {
    CheckSize((uint64_t)a1, 1);
    uint64_t v4 = *a1;
    uint64_t v5 = a1[2];
    a1[2] = v5 + 1;
    LOBYTE(v4) = *(unsigned char *)(v4 + v5);
    v3 |= (v4 & 0x7F) << v2;
    v2 += 7;
    if ((v4 & 0x80) == 0) {
      return v3;
    }
  }
  RaiseException(-105, @"Invalid VarInt64");
  return 0;
}

uint64_t CheckSize(uint64_t result, uint64_t a2)
{
  unint64_t v2 = (void *)result;
  uint64_t v3 = *(void *)(result + 16);
  unint64_t v4 = v3 + a2;
  if (__CFADD__(v3, a2)) {
    uint64_t result = RaiseException(-100, @"Buffer size overflow");
  }
  if (v4 > v2[1]) {
    uint64_t result = RaiseException(-100, 0);
  }
  unint64_t v5 = v2[3];
  if (v4 > v5)
  {
    v2[2] = v5;
    return RaiseException(-101, 0);
  }
  return result;
}

void *TRIPBBecomeVisibleToAutocreator(void *a1)
{
  uint64_t result = (void *)a1[4];
  if (result)
  {
    if (a1[5])
    {
      uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(result, "descriptor"), "file"), "syntax");
      uint64_t v4 = a1[4];
      uint64_t v5 = a1[5];
      v6 = a1;
      return (void *)TRIPBSetRetainedObjectIvarWithFieldInternal(v4, v5, v6, v3);
    }
    else
    {
      uint64_t v7 = a1[6];
      return (void *)[result setExtension:v7 value:a1];
    }
  }
  return result;
}

void *TRIPBSetRetainedObjectIvarWithFieldInternal(void *a1, uint64_t a2, void *a3, int a4)
{
  if (!a1[8])
  {
    v18 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "void TRIPBSetRetainedObjectIvarWithFieldInternal(TRIPBMessage *, TRIPBFieldDescriptor *, id, TRIPBFileSyntax)"), @"TRIPBUtilities.m", 507, @"%@: All messages should have storage (from init)", objc_opt_class() file lineNumber description];
  }
  uint64_t v8 = *(void *)(a2 + 8);
  int v9 = *(unsigned __int8 *)(v8 + 30);
  unsigned int v10 = v9 - 15;
  int v11 = *(_WORD *)(v8 + 28) & 0xF02;
  if ((*(_WORD *)(v8 + 28) & 0xF02) == 0)
  {
    uint64_t v12 = *(void *)(a2 + 16);
    if (v12) {
      TRIPBMaybeClearOneof((uint64_t)a1, *(void **)(a2 + 16), *(unsigned int *)(v8 + 20), *(_DWORD *)(v8 + 16));
    }
    BOOL v13 = a3 != 0;
    if (a4 == 3 && v10 >= 2 && ![a3 length])
    {
      if (a3 && v12)
      {
        BOOL v13 = 1;
      }
      else
      {

        a3 = 0;
        BOOL v13 = 0;
      }
    }
    TRIPBSetHasIvar((uint64_t)a1, *(_DWORD *)(*(void *)(a2 + 8) + 20), *(_DWORD *)(*(void *)(a2 + 8) + 16), v13);
    uint64_t v8 = *(void *)(a2 + 8);
  }
  uint64_t v14 = a1[8];
  uint64_t v15 = *(unsigned int *)(v8 + 24);
  v16 = *(void **)(v14 + v15);
  *(void *)(v14 + v15) = a3;
  if (v16)
  {
    if (!v11)
    {
      if (v10 <= 1 && (void *)v16[4] == a1) {
        TRIPBClearMessageAutocreator((uint64_t)v16);
      }
      goto LABEL_30;
    }
    if ([(id)a2 fieldType] == 1)
    {
      if ((v9 - 13) <= 3)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
LABEL_26:
          if ((void *)v16[1] == a1) {
            v16[1] = 0;
          }
        }
LABEL_30:

        goto LABEL_31;
      }
    }
    else if ([(id)a2 mapKeyDataType] == 14 && (v9 - 13) <= 3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_26;
      }
      goto LABEL_30;
    }
    if ((void *)v16[1] == a1) {
      v16[1] = 0;
    }
    goto LABEL_30;
  }
LABEL_31:
  return TRIPBBecomeVisibleToAutocreator(a1);
}

uint64_t TRIPBSetHasIvar(uint64_t result, unsigned int a2, int a3, int a4)
{
  uint64_t v6 = result;
  if ((a2 & 0x80000000) != 0)
  {
    if (!a3)
    {
      uint64_t v14 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      uint64_t result = objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void TRIPBSetHasIvar(TRIPBMessage *, int32_t, uint32_t, BOOL)"), @"TRIPBUtilities.m", 313, @"Invalid field number.");
    }
    if (a4) {
      int v12 = a3;
    }
    else {
      int v12 = 0;
    }
    *(_DWORD *)(*(void *)(v6 + 64) + 4 * -a2) = v12;
  }
  else
  {
    if (a2 == 0x7FFFFFFF)
    {
      BOOL v13 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      uint64_t result = objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void TRIPBSetHasIvar(TRIPBMessage *, int32_t, uint32_t, BOOL)"), @"TRIPBUtilities.m", 317, @"Invalid has bit.");
    }
    uint64_t v7 = *(void *)(v6 + 64);
    unsigned int v8 = a2 >> 5;
    int v9 = 1 << a2;
    if (a4) {
      int v10 = *(_DWORD *)(v7 + 4 * v8) | v9;
    }
    else {
      int v10 = *(_DWORD *)(v7 + 4 * v8) & ~v9;
    }
    *(_DWORD *)(v7 + 4 * v8) = v10;
  }
  return result;
}

uint64_t TRIPBGetObjectIvarWithField(uint64_t a1, void *a2)
{
  uint64_t v4 = a2[1];
  if ((*(_WORD *)(v4 + 28) & 0xF02) != 0)
  {
    int v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "id TRIPBGetObjectIvarWithField(TRIPBMessage *, TRIPBFieldDescriptor *)"), @"TRIPBMessage.m", 3304, @"Shouldn't get here");
    uint64_t v4 = a2[1];
  }
  if (TRIPBGetHasIvar(a1, *(_DWORD *)(v4 + 20), *(_DWORD *)(v4 + 16))) {
    return *(void *)(*(void *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
  }
  if (*(unsigned __int8 *)(a2[1] + 30) - 15 >= 2) {
    return [a2 defaultValue];
  }
  TRIPBPrepareReadOnlySemaphore(a1);
  uint64_t v6 = atomic_load((unint64_t *)(a1 + 56));
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v7 = *(void *)(a1 + 64);
  if (!v7 || (uint64_t v5 = *(void **)(v7 + *(unsigned int *)(a2[1] + 24))) == 0)
  {
    uint64_t v5 = objc_alloc_init((Class)[a2 msgClass]);
    v5[4] = a1;
    v5[5] = a2;
    TRIPBSetAutocreatedRetainedObjectIvarWithField(a1, (uint64_t)a2, (uint64_t)v5);
  }
  unsigned int v8 = atomic_load((unint64_t *)(a1 + 56));
  dispatch_semaphore_signal(v8);
  return (uint64_t)v5;
}

BOOL TRIPBGetHasIvar(uint64_t a1, unsigned int a2, int a3)
{
  if (*(void *)(a1 + 64))
  {
    if ((a2 & 0x80000000) == 0)
    {
LABEL_3:
      if (a2 == 0x7FFFFFFF)
      {
        unsigned int v8 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "BOOL TRIPBGetHasIvar(TRIPBMessage *, int32_t, uint32_t)"), @"TRIPBUtilities.m", 294, @"Invalid has bit.");
      }
      return (*(_DWORD *)(*(void *)(a1 + 64) + 4 * (a2 >> 5)) >> a2) & 1;
    }
  }
  else
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "BOOL TRIPBGetHasIvar(TRIPBMessage *, int32_t, uint32_t)"), @"TRIPBUtilities.m", 288, @"%@: All messages should have storage (from init)", objc_opt_class() file lineNumber description];
    if ((a2 & 0x80000000) == 0) {
      goto LABEL_3;
    }
  }
  if (!a3)
  {
    int v9 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "BOOL TRIPBGetHasIvar(TRIPBMessage *, int32_t, uint32_t)"), @"TRIPBUtilities.m", 290, @"Invalid field number.");
  }
  return *(_DWORD *)(*(void *)(a1 + 64) + 4 * -a2) == a3;
}

void TRIPBClearAutocreatedMessageIvarWithField(uint64_t a1, uint64_t a2)
{
  if (!TRIPBGetHasIvar(a1, *(_DWORD *)(*(void *)(a2 + 8) + 20), *(_DWORD *)(*(void *)(a2 + 8) + 16)))
  {
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v5 = *(unsigned int *)(*(void *)(a2 + 8) + 24);
    uint64_t v6 = *(void *)(v4 + v5);
    id v7 = (id)v6;
    *(void *)(v4 + v5) = 0;
    TRIPBClearMessageAutocreator(v6);
  }
}

void TRIPBClearMessageAutocreator(uint64_t a1)
{
  if (a1)
  {
    if (*(void *)(a1 + 32))
    {
      *(void *)(a1 + 32) = 0;

      *(void *)(a1 + 40) = 0;
      *(void *)(a1 + 48) = 0;
    }
  }
}

void *CloneExtensionMap(void *a1, uint64_t a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (![a1 count]) {
    return 0;
  }
  uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA60], "allocWithZone:", a2), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v5 = [a1 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    uint64_t v21 = *(void *)v29;
    v22 = v4;
    do
    {
      uint64_t v8 = 0;
      uint64_t v23 = v6;
      do
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(a1);
        }
        int v9 = *(void **)(*((void *)&v28 + 1) + 8 * v8);
        int v10 = (void *)[a1 objectForKey:v9];
        unsigned int v11 = *(unsigned __int8 *)(v9[1] + 44) - 15;
        if ([v9 isRepeated])
        {
          if (v11 > 1)
          {
            uint64_t v18 = [v10 mutableCopyWithZone:a2];
            goto LABEL_20;
          }
          int v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          uint64_t v13 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v25;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v25 != v15) {
                  objc_enumerationMutation(v10);
                }
                v17 = (void *)[*(id *)(*((void *)&v24 + 1) + 8 * i) copyWithZone:a2];
                [v12 addObject:v17];
              }
              uint64_t v14 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v14);
          }
          uint64_t v4 = v22;
          [v22 setObject:v12 forKey:v9];

          uint64_t v7 = v21;
          uint64_t v6 = v23;
        }
        else
        {
          if (v11 <= 1)
          {
            uint64_t v18 = [v10 copyWithZone:a2];
LABEL_20:
            v19 = (void *)v18;
            [v4 setObject:v18 forKey:v9];

            goto LABEL_22;
          }
          [v4 setObject:v10 forKey:v9];
        }
LABEL_22:
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [a1 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v6);
  }
  return v4;
}

__CFString *TRIPBCodedInputStreamReadRetainedString(uint64_t *a1)
{
  int RawVarint64 = ReadRawVarint64(a1);
  int v3 = RawVarint64;
  if (RawVarint64 < 0)
  {
    RaiseException(-104, @"Field delimited with negative length");
  }
  else if (!RawVarint64)
  {
    return &stru_1EE43FA58;
  }
  CheckSize((uint64_t)a1, v3);
  uint64_t result = (__CFString *)[[NSString alloc] initWithBytes:*a1 + a1[2] length:v3 encoding:4];
  a1[2] += v3;
  if (!result)
  {
    NSLog(&cfstr_Utf8FailureIsS.isa);
    RaiseException(-104, 0);
    return 0;
  }
  return result;
}

void *TRIPBSetInt32IvarWithFieldInternal(void *a1, uint64_t a2, int a3, int a4)
{
  uint64_t v8 = *(void **)(a2 + 16);
  if (v8) {
    TRIPBMaybeClearOneof((uint64_t)a1, v8, *(unsigned int *)(*(void *)(a2 + 8) + 20), *(_DWORD *)(*(void *)(a2 + 8) + 16));
  }
  *(_DWORD *)(a1[8] + *(unsigned int *)(*(void *)(a2 + 8) + 24)) = a3;
  BOOL v9 = 1;
  if (!a3 && a4 != 2) {
    BOOL v9 = *(void *)(a2 + 16) != 0;
  }
  TRIPBSetHasIvar((uint64_t)a1, *(_DWORD *)(*(void *)(a2 + 8) + 20), *(_DWORD *)(*(void *)(a2 + 8) + 16), v9);
  return TRIPBBecomeVisibleToAutocreator(a1);
}

uint64_t TRIPBMaybeClearOneof(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  unsigned int v5 = a3;
  uint64_t result = TRIPBGetHasOneof(a1, a3);
  if (result != a4)
  {
    uint64_t v9 = result;
    if (result)
    {
      uint64_t v10 = [a2 fieldWithNumber:result];
      if (v10)
      {
        uint64_t v11 = *(void *)(v10 + 8);
        if ((*(_WORD *)(v11 + 28) & 0xF02) != 0 || *(unsigned __int8 *)(v11 + 30) - 13 <= 3)
        {
          uint64_t v12 = *(void *)(a1 + 64);
          uint64_t v13 = *(unsigned int *)(v11 + 24);

          *(void *)(v12 + v13) = 0;
        }
      }
      else
      {
        uint64_t v14 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "void TRIPBMaybeClearOneof(TRIPBMessage *, TRIPBOneofDescriptor *, int32_t, uint32_t)"), @"TRIPBUtilities.m", 342, @"%@: oneof set to something (%u) not in the oneof?", objc_opt_class(), v9 file lineNumber description];
      }
      return TRIPBSetHasIvar(a1, v5, 1, 0);
    }
  }
  return result;
}

uint64_t TRIPBGetHasOneof(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0x80000000) == 0)
  {
    unsigned int v5 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "uint32_t TRIPBGetHasOneof(TRIPBMessage *, int32_t)"), @"TRIPBUtilities.m", 305, @"%@: invalid index (%d) for oneof.", objc_opt_class(), a2 file lineNumber description];
  }
  return *(unsigned int *)(*(void *)(a1 + 64) - 4 * (int)a2);
}

uint64_t TRINamespace_NamespaceId_IsValidValue(int a1)
{
  uint64_t result = 1;
  if (a1 <= 799)
  {
    if (a1 > 300)
    {
      if (a1 <= 560)
      {
        switch(a1)
        {
          case 301:
          case 311:
          case 312:
          case 313:
          case 314:
          case 321:
          case 322:
          case 331:
          case 332:
          case 333:
          case 334:
          case 335:
          case 336:
          case 337:
          case 341:
          case 342:
          case 351:
          case 352:
          case 353:
          case 354:
          case 361:
          case 371:
          case 372:
          case 373:
          case 374:
          case 375:
          case 381:
          case 391:
          case 392:
          case 393:
          case 394:
          case 395:
          case 401:
          case 402:
          case 403:
          case 404:
          case 405:
          case 406:
          case 407:
          case 408:
          case 409:
          case 411:
          case 412:
          case 413:
          case 414:
          case 415:
          case 416:
          case 417:
          case 421:
          case 422:
          case 423:
          case 424:
          case 425:
          case 426:
          case 427:
          case 428:
          case 431:
            return result;
          case 302:
          case 303:
          case 304:
          case 305:
          case 306:
          case 307:
          case 308:
          case 309:
          case 310:
          case 315:
          case 316:
          case 317:
          case 318:
          case 319:
          case 320:
          case 323:
          case 324:
          case 325:
          case 326:
          case 327:
          case 328:
          case 329:
          case 330:
          case 338:
          case 339:
          case 340:
          case 343:
          case 344:
          case 345:
          case 346:
          case 347:
          case 348:
          case 349:
          case 350:
          case 355:
          case 356:
          case 357:
          case 358:
          case 359:
          case 360:
          case 362:
          case 363:
          case 364:
          case 365:
          case 366:
          case 367:
          case 368:
          case 369:
          case 370:
          case 376:
          case 377:
          case 378:
          case 379:
          case 380:
          case 382:
          case 383:
          case 384:
          case 385:
          case 386:
          case 387:
          case 388:
          case 389:
          case 390:
          case 396:
          case 397:
          case 398:
          case 399:
          case 400:
          case 410:
          case 418:
          case 419:
          case 420:
          case 429:
          case 430:
            return 0;
          default:
            unsigned int v12 = a1 - 501;
            if (v12 > 0x32) {
              return 0;
            }
            uint64_t v4 = 1 << v12;
            unsigned int v7 = -1070564349;
            goto LABEL_46;
        }
      }
      switch(a1)
      {
        case 561:
        case 562:
        case 563:
        case 564:
        case 565:
        case 566:
        case 567:
        case 568:
        case 569:
        case 570:
        case 571:
        case 581:
        case 582:
        case 583:
        case 584:
        case 585:
        case 586:
        case 587:
        case 588:
        case 589:
        case 591:
        case 592:
        case 593:
        case 601:
        case 602:
        case 603:
        case 604:
        case 605:
        case 611:
        case 621:
        case 631:
        case 641:
        case 642:
          return result;
        case 572:
        case 573:
        case 574:
        case 575:
        case 576:
        case 577:
        case 578:
        case 579:
        case 580:
        case 590:
        case 594:
        case 595:
        case 596:
        case 597:
        case 598:
        case 599:
        case 600:
        case 606:
        case 607:
        case 608:
        case 609:
        case 610:
        case 612:
        case 613:
        case 614:
        case 615:
        case 616:
        case 617:
        case 618:
        case 619:
        case 620:
        case 622:
        case 623:
        case 624:
        case 625:
        case 626:
        case 627:
        case 628:
        case 629:
        case 630:
        case 632:
        case 633:
        case 634:
        case 635:
        case 636:
        case 637:
        case 638:
        case 639:
        case 640:
          return 0;
        default:
          if ((a1 - 750) < 0xF) {
            return result;
          }
          unsigned int v10 = a1 - 651;
          if (v10 > 0x36) {
            return 0;
          }
          uint64_t v4 = 1 << v10;
          uint64_t v9 = 0x7E000000000001;
          break;
      }
LABEL_53:
      if ((v4 & v9) != 0) {
        return result;
      }
      return 0;
    }
    if (a1 <= 99)
    {
      if ((a1 > 0x3E || ((1 << a1) & 0x707C0300C0107803) == 0) && a1 != 71 && a1 != 80) {
        return 0;
      }
    }
    else
    {
      switch(a1)
      {
        case 100:
        case 101:
        case 102:
        case 103:
        case 104:
        case 105:
        case 106:
        case 107:
        case 108:
        case 109:
        case 110:
        case 120:
        case 130:
        case 150:
        case 151:
        case 152:
        case 153:
        case 154:
        case 155:
        case 156:
        case 157:
        case 158:
        case 159:
        case 160:
        case 161:
        case 162:
        case 163:
        case 164:
        case 165:
        case 166:
        case 167:
        case 168:
        case 169:
        case 170:
        case 171:
        case 180:
        case 181:
        case 182:
        case 190:
        case 191:
        case 200:
        case 201:
        case 210:
        case 211:
        case 212:
        case 213:
        case 214:
        case 215:
          return result;
        case 111:
        case 112:
        case 113:
        case 114:
        case 115:
        case 116:
        case 117:
        case 118:
        case 119:
        case 121:
        case 122:
        case 123:
        case 124:
        case 125:
        case 126:
        case 127:
        case 128:
        case 129:
        case 131:
        case 132:
        case 133:
        case 134:
        case 135:
        case 136:
        case 137:
        case 138:
        case 139:
        case 140:
        case 141:
        case 142:
        case 143:
        case 144:
        case 145:
        case 146:
        case 147:
        case 148:
        case 149:
        case 172:
        case 173:
        case 174:
        case 175:
        case 176:
        case 177:
        case 178:
        case 179:
        case 183:
        case 184:
        case 185:
        case 186:
        case 187:
        case 188:
        case 189:
        case 192:
        case 193:
        case 194:
        case 195:
        case 196:
        case 197:
        case 198:
        case 199:
        case 202:
        case 203:
        case 204:
        case 205:
        case 206:
        case 207:
        case 208:
        case 209:
          return 0;
        default:
          if ((a1 - 251) >= 9) {
            return 0;
          }
          break;
      }
    }
  }
  else if (a1 > 1289)
  {
    if (a1 > 1579)
    {
      if (a1 <= 1719)
      {
        if ((a1 - 1580) > 0x3C || ((1 << (a1 - 44)) & 0x101C030040F00401) == 0)
        {
          unsigned int v11 = a1 - 1650;
          if (v11 > 0x3C) {
            return 0;
          }
          uint64_t v4 = 1 << v11;
          uint64_t v9 = 0x101C010040300401;
          goto LABEL_53;
        }
      }
      else if (((a1 - 1720) > 0x3C || ((1 << (a1 + 72)) & 0x1004030040300403) == 0) {
             && ((a1 - 1790) > 0x3C || ((1 << (a1 + 2)) & 0x1004010040100401) == 0))
      }
      {
        unsigned int v8 = a1 - 1860;
        if (v8 > 0x3C) {
          return 0;
        }
        uint64_t v4 = 1 << v8;
        uint64_t v9 = 0x1004010040100401;
        goto LABEL_53;
      }
    }
    else if (a1 > 1489)
    {
      switch(a1)
      {
        case 1490:
        case 1491:
        case 1500:
        case 1510:
        case 1511:
        case 1512:
        case 1513:
        case 1520:
        case 1521:
        case 1530:
        case 1540:
        case 1541:
        case 1542:
        case 1543:
        case 1544:
        case 1545:
        case 1546:
        case 1547:
        case 1548:
        case 1549:
        case 1550:
        case 1551:
        case 1552:
        case 1553:
        case 1554:
        case 1555:
        case 1556:
        case 1557:
        case 1558:
        case 1559:
        case 1560:
        case 1570:
        case 1571:
          return result;
        default:
          return 0;
      }
    }
    else if (((a1 - 1290) > 0x3C || ((1 << (a1 - 10)) & 0x103C03FFC0100407) == 0) {
           && ((a1 - 1360) > 0x3C || ((1 << (a1 - 80)) & 0x100C010040100401) == 0))
    }
    {
      unsigned int v3 = a1 - 1430;
      if (v3 > 0x32) {
        return 0;
      }
      uint64_t v4 = 1 << v3;
      unsigned __int16 v5 = 3075;
      goto LABEL_23;
    }
  }
  else
  {
    if (a1 <= 1089)
    {
      switch(a1)
      {
        case 800:
        case 801:
        case 802:
        case 803:
        case 804:
        case 805:
        case 810:
        case 811:
        case 812:
        case 813:
        case 814:
        case 815:
        case 816:
        case 817:
        case 818:
        case 819:
        case 820:
        case 821:
        case 822:
        case 823:
        case 824:
        case 825:
        case 830:
        case 831:
        case 832:
        case 833:
        case 834:
        case 835:
        case 836:
        case 837:
        case 838:
        case 839:
        case 840:
        case 841:
        case 842:
        case 843:
        case 844:
        case 845:
        case 846:
        case 847:
        case 848:
        case 849:
        case 850:
        case 851:
        case 852:
        case 860:
        case 861:
        case 862:
        case 863:
        case 870:
        case 871:
        case 872:
        case 873:
        case 874:
        case 880:
        case 890:
        case 900:
        case 910:
        case 920:
        case 921:
        case 922:
        case 923:
        case 924:
        case 930:
        case 940:
        case 950:
        case 960:
        case 961:
        case 962:
        case 963:
        case 970:
          return result;
        case 806:
        case 807:
        case 808:
        case 809:
        case 826:
        case 827:
        case 828:
        case 829:
        case 853:
        case 854:
        case 855:
        case 856:
        case 857:
        case 858:
        case 859:
        case 864:
        case 865:
        case 866:
        case 867:
        case 868:
        case 869:
        case 875:
        case 876:
        case 877:
        case 878:
        case 879:
        case 881:
        case 882:
        case 883:
        case 884:
        case 885:
        case 886:
        case 887:
        case 888:
        case 889:
        case 891:
        case 892:
        case 893:
        case 894:
        case 895:
        case 896:
        case 897:
        case 898:
        case 899:
        case 901:
        case 902:
        case 903:
        case 904:
        case 905:
        case 906:
        case 907:
        case 908:
        case 909:
        case 911:
        case 912:
        case 913:
        case 914:
        case 915:
        case 916:
        case 917:
        case 918:
        case 919:
        case 925:
        case 926:
        case 927:
        case 928:
        case 929:
        case 931:
        case 932:
        case 933:
        case 934:
        case 935:
        case 936:
        case 937:
        case 938:
        case 939:
        case 941:
        case 942:
        case 943:
        case 944:
        case 945:
        case 946:
        case 947:
        case 948:
        case 949:
        case 951:
        case 952:
        case 953:
        case 954:
        case 955:
        case 956:
        case 957:
        case 958:
        case 959:
        case 964:
        case 965:
        case 966:
        case 967:
        case 968:
        case 969:
          return 0;
        default:
          unsigned int v13 = a1 - 980;
          if (v13 > 0x3F) {
            return 0;
          }
          uint64_t v4 = 1 << v13;
          uint64_t v9 = 0xF004010040100401;
          goto LABEL_53;
      }
    }
    if (((a1 - 1150) > 0x3C || ((1 << (a1 - 126)) & 0x101C030040101C1FLL) == 0)
      && ((a1 - 1220) > 0x3C || ((1 << (a1 + 60)) & 0x10040701C0300C03) == 0))
    {
      unsigned int v6 = a1 - 1090;
      if (v6 > 0x32) {
        return 0;
      }
      uint64_t v4 = 1 << v6;
      unsigned __int16 v5 = 3073;
LABEL_23:
      unsigned int v7 = v5 | 0x40100000;
LABEL_46:
      uint64_t v9 = v7 | 0x4010000000000;
      goto LABEL_53;
    }
  }
  return result;
}

uint64_t TRIFactor_FactorType_IsValidValue(unsigned int a1)
{
  uint64_t result = 1;
  if (a1 > 0x10 || ((1 << a1) & 0x1FC01) == 0)
  {
    unsigned int v3 = a1 - 100;
    if (v3 > 4 || ((1 << v3) & 0x13) == 0) {
      return 0;
    }
  }
  return result;
}

void MergeRepeatedNotPackedFieldFromCodedInputStream(void *a1, void *a2, int a3, uint64_t *a4, uint64_t a5)
{
  ArrayIvarWithField = GetOrCreateArrayIvarWithField(a1, a2, a3);
  unsigned int v11 = a4 + 1;
  switch(*(unsigned char *)(a2[1] + 30))
  {
    case 0:
      ReadRawVarint64(v11);
      goto LABEL_10;
    case 1:
    case 2:
      CheckSize((uint64_t)v11, 4);
      a4[3] += 4;
      goto LABEL_10;
    case 3:
      CheckSize((uint64_t)v11, 4);
      uint64_t v14 = a4[3];
      LODWORD(v12) = *(_DWORD *)(a4[1] + v14);
      a4[3] = v14 + 4;
      unsigned int v13 = ArrayIvarWithField;
      goto LABEL_8;
    case 4:
    case 5:
      CheckSize((uint64_t)v11, 8);
      a4[3] += 8;
      goto LABEL_15;
    case 6:
      CheckSize((uint64_t)v11, 8);
      uint64_t v19 = a4[3];
      double v12 = *(double *)(a4[1] + v19);
      a4[3] = v19 + 8;
      unsigned int v13 = ArrayIvarWithField;
      goto LABEL_8;
    case 7:
    case 0xB:
      ReadRawVarint64(v11);
      unsigned int v13 = ArrayIvarWithField;
      goto LABEL_11;
    case 8:
    case 0xA:
    case 0xC:
      ReadRawVarint64(v11);
LABEL_15:
      unsigned int v13 = ArrayIvarWithField;
      goto LABEL_8;
    case 9:
      ReadRawVarint64(v11);
LABEL_10:
      unsigned int v13 = ArrayIvarWithField;
LABEL_11:
LABEL_8:
      [(TRIPBAutocreatedArray *)v13 addValue:v12];
      return;
    case 0xD:
      uint64_t RetainedBytes = TRIPBCodedInputStreamReadRetainedBytes(v11);
      goto LABEL_31;
    case 0xE:
      uint64_t RetainedBytes = (uint64_t)TRIPBCodedInputStreamReadRetainedString(v11);
LABEL_31:
      id v17 = (id)RetainedBytes;
      id v22 = (id)RetainedBytes;
      v16 = ArrayIvarWithField;
      goto LABEL_32;
    case 0xF:
      id v22 = objc_alloc_init((Class)[a2 msgClass]);
      [a4 readMessage:v22 extensionRegistry:a5];
      goto LABEL_21;
    case 0x10:
      id v22 = objc_alloc_init((Class)[a2 msgClass]);
      [a4 readGroup:*(unsigned int *)(a2[1] + 16) message:v22 extensionRegistry:a5];
LABEL_21:
      v16 = ArrayIvarWithField;
      id v17 = v22;
LABEL_32:
      [(TRIPBAutocreatedArray *)v16 addObject:v17];

      break;
    case 0x11:
      uint64_t RawVarint64 = ReadRawVarint64(v11);
      if (a3 == 3 || [a2 isValidEnumValue:RawVarint64])
      {
        [(TRIPBAutocreatedArray *)ArrayIvarWithField addRawValue:RawVarint64];
      }
      else
      {
        UnknownFields = (void *)GetOrMakeUnknownFields(a1);
        uint64_t v21 = *(unsigned int *)(a2[1] + 16);
        [UnknownFields mergeVarintField:v21 value:RawVarint64];
      }
      break;
    default:
      return;
  }
}

TRIPBAutocreatedArray *GetOrCreateArrayIvarWithField(void *a1, void *a2, int a3)
{
  uint64_t v6 = a1[8];
  if (!v6 || (ArrayForField = *(TRIPBAutocreatedArray **)(v6 + *(unsigned int *)(a2[1] + 24))) == 0)
  {
    ArrayForField = CreateArrayForField(a2, 0);
    TRIPBSetRetainedObjectIvarWithFieldInternal(a1, (uint64_t)a2, ArrayForField, a3);
  }
  return ArrayForField;
}

uint64_t TRIPBDecodeTextFormatName(char *a1, int a2, void *a3)
{
  unsigned int v3 = 0;
  if (a1 && a3)
  {
    uint64_t v23 = a1;
    int v6 = ReadRawVarint32FromData(&v23);
    if (v6 < 1)
    {
      return 0;
    }
    else
    {
      int v7 = v6;
      while (1)
      {
        int v8 = ReadRawVarint32FromData(&v23);
        uint64_t v9 = v23;
        if (v8 == a2) {
          break;
        }
        unsigned int v10 = v23 + 1;
        while (*v10++)
          ;
        uint64_t v23 = v10;
        if (v7-- < 2) {
          return 0;
        }
      }
      if (*v23)
      {
        unsigned int v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(a3, "length"));
        char v14 = *v9;
        if (*v9)
        {
          uint64_t v15 = 0;
          while (1)
          {
            if (v14 < 0)
            {
              [v3 appendString:@"_"];
              char v14 = *v9;
            }
            int v16 = v14 & 0x1F;
            int v17 = v14 & 0x60;
            if (v17 == 32) {
              break;
            }
            if (v17 == 64)
            {
              uint64_t v18 = __toupper((char)[a3 characterAtIndex:v15]);
LABEL_21:
              objc_msgSend(v3, "appendFormat:", @"%c", v18);
              ++v15;
              --v16;
            }
            if (v16 >= 1)
            {
              uint64_t v19 = v16;
              uint64_t v20 = v15;
              do
              {
                uint64_t v21 = [a3 characterAtIndex:v20];
                if (v17 == 96) {
                  objc_msgSend(v3, "appendFormat:", @"%c", __toupper((char)v21));
                }
                else {
                  objc_msgSend(v3, "appendFormat:", @"%C", v21);
                }
                ++v20;
                --v19;
              }
              while (v19);
            }
            v15 += v16;
            int v22 = *++v9;
            char v14 = v22;
            if (!v22) {
              return (uint64_t)v3;
            }
          }
          uint64_t v18 = __tolower((char)[a3 characterAtIndex:v15]);
          goto LABEL_21;
        }
      }
      else
      {
        return [NSString stringWithUTF8String:v23 + 1];
      }
    }
  }
  return (uint64_t)v3;
}

uint64_t ReadRawVarint32FromData(char **a1)
{
  v1 = *a1;
  uint64_t v2 = *(*a1)++;
  if ((v2 & 0x80000000) != 0)
  {
    unsigned int v3 = v2 & 0x7F;
    int v4 = v1[1];
    *a1 = v1 + 2;
    int v5 = v4 << 7;
    if ((v4 & 0x80000000) == 0) {
      return v5 | v3;
    }
    v3 |= v5 & 0x3F80;
    int v6 = v1[2];
    *a1 = v1 + 3;
    int v5 = v6 << 14;
    if ((v6 & 0x80000000) == 0) {
      return v5 | v3;
    }
    v3 |= v5 & 0x1FC000;
    int v7 = v1[3];
    *a1 = v1 + 4;
    int v5 = v7 << 21;
    if (v7 < 0)
    {
      int v9 = v1[4];
      *a1 = v1 + 5;
      uint64_t v2 = v5 & 0xFE00000 | (v9 << 28) | v3;
      if (v9 < 0)
      {
        uint64_t v10 = 0;
        while (1)
        {
          int v11 = v1[v10 + 5];
          *a1 = &v1[v10 + 6];
          if ((v11 & 0x80000000) == 0) {
            break;
          }
          if (++v10 == 5)
          {
            [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F287A8] format:@"Unable to read varint32"];
            return v2;
          }
        }
      }
    }
    else
    {
      return v5 | v3;
    }
  }
  return v2;
}

void *TRIPBSetBoolIvarWithFieldInternal(void *a1, uint64_t a2, int a3, int a4)
{
  uint64_t v9 = *(void *)(a2 + 8);
  int v8 = *(void **)(a2 + 16);
  if (v8) {
    TRIPBMaybeClearOneof((uint64_t)a1, v8, *(unsigned int *)(v9 + 20), *(_DWORD *)(v9 + 16));
  }
  TRIPBSetHasIvar((uint64_t)a1, *(_DWORD *)(v9 + 24), *(_DWORD *)(v9 + 16), a3);
  BOOL v10 = 1;
  if (a4 != 2 && (a3 & 1) == 0) {
    BOOL v10 = *(void *)(a2 + 16) != 0;
  }
  TRIPBSetHasIvar((uint64_t)a1, *(_DWORD *)(*(void *)(a2 + 8) + 20), *(_DWORD *)(*(void *)(a2 + 8) + 16), v10);
  return TRIPBBecomeVisibleToAutocreator(a1);
}

void *TRIPBSetDoubleIvarWithFieldInternal(void *a1, uint64_t a2, int a3, double a4)
{
  int v8 = *(void **)(a2 + 16);
  if (v8) {
    TRIPBMaybeClearOneof((uint64_t)a1, v8, *(unsigned int *)(*(void *)(a2 + 8) + 20), *(_DWORD *)(*(void *)(a2 + 8) + 16));
  }
  *(double *)(a1[8] + *(unsigned int *)(*(void *)(a2 + 8) + 24)) = a4;
  int v10 = a4 != 0.0 || a3 == 2 || *(void *)(a2 + 16) != 0;
  TRIPBSetHasIvar((uint64_t)a1, *(_DWORD *)(*(void *)(a2 + 8) + 20), *(_DWORD *)(*(void *)(a2 + 8) + 16), v10);
  return TRIPBBecomeVisibleToAutocreator(a1);
}

void *TRIPBSetInt64IvarWithFieldInternal(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  int v8 = *(void **)(a2 + 16);
  if (v8) {
    TRIPBMaybeClearOneof((uint64_t)a1, v8, *(unsigned int *)(*(void *)(a2 + 8) + 20), *(_DWORD *)(*(void *)(a2 + 8) + 16));
  }
  *(void *)(a1[8] + *(unsigned int *)(*(void *)(a2 + 8) + 24)) = a3;
  BOOL v9 = 1;
  if (!a3 && a4 != 2) {
    BOOL v9 = *(void *)(a2 + 16) != 0;
  }
  TRIPBSetHasIvar((uint64_t)a1, *(_DWORD *)(*(void *)(a2 + 8) + 20), *(_DWORD *)(*(void *)(a2 + 8) + 16), v9);
  return TRIPBBecomeVisibleToAutocreator(a1);
}

void sub_1935CE29C(_Unwind_Exception *a1)
{
}

void sub_1935CE2BC(void *a1)
{
}

TRIPBAutocreatedArray *CreateArrayForField(void *a1, TRIPBMessage *a2)
{
  int v3 = *(unsigned __int8 *)(a1[1] + 30);
  switch(*(unsigned char *)(a1[1] + 30))
  {
    case 0:
      int v5 = TRIPBBoolArray;
      goto LABEL_16;
    case 1:
    case 0xB:
      int v5 = TRIPBUInt32Array;
      goto LABEL_16;
    case 2:
    case 7:
    case 9:
      int v5 = TRIPBInt32Array;
      goto LABEL_16;
    case 3:
      int v5 = TRIPBFloatArray;
      goto LABEL_16;
    case 4:
    case 0xC:
      int v5 = TRIPBUInt64Array;
      goto LABEL_16;
    case 5:
    case 8:
    case 0xA:
      int v5 = TRIPBInt64Array;
      goto LABEL_16;
    case 6:
      int v5 = TRIPBDoubleArray;
LABEL_16:
      uint64_t result = (TRIPBAutocreatedArray *)objc_alloc_init(v5);
      if (a2) {
        goto LABEL_17;
      }
      return result;
    case 0xD:
    case 0xE:
    case 0xF:
    case 0x10:
      if (a2)
      {
        uint64_t result = objc_alloc_init(TRIPBAutocreatedArray);
LABEL_18:
        result->_autocreator = a2;
      }
      else
      {
        int v6 = (objc_class *)MEMORY[0x1E4F1CA48];
        uint64_t result = (TRIPBAutocreatedArray *)objc_alloc_init(v6);
      }
      break;
    case 0x11:
      uint64_t result = -[TRIPBEnumArray initWithValidationFunction:]([TRIPBEnumArray alloc], "initWithValidationFunction:", objc_msgSend((id)objc_msgSend(a1, "enumDescriptor"), "enumVerifier"));
      if (!a2) {
        return result;
      }
      goto LABEL_17;
    default:
      uint64_t result = 0;
      if (!a2) {
        return result;
      }
LABEL_17:
      if ((v3 - 13) <= 3) {
        goto LABEL_18;
      }
      result->_autocreator = a2;
      break;
  }
  return result;
}

TRIPBFileDescriptor *TRITrifactorRoot_FileDescriptor()
{
  uint64_t result = (TRIPBFileDescriptor *)TRITrifactorRoot_FileDescriptor_descriptor;
  if (!TRITrifactorRoot_FileDescriptor_descriptor)
  {
    uint64_t result = [[TRIPBFileDescriptor alloc] initWithPackage:@"TRI" objcPrefix:@"TRI" syntax:2];
    TRITrifactorRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

void sub_1935CE648(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

TRIPBFileDescriptor *TRITriclientExperimentRoot_FileDescriptor()
{
  uint64_t result = (TRIPBFileDescriptor *)TRITriclientExperimentRoot_FileDescriptor_descriptor;
  if (!TRITriclientExperimentRoot_FileDescriptor_descriptor)
  {
    uint64_t result = [[TRIPBFileDescriptor alloc] initWithPackage:@"TRI" objcPrefix:@"TRI" syntax:2];
    TRITriclientExperimentRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

TRIPBFileDescriptor *TRITrifactorTypesRoot_FileDescriptor()
{
  uint64_t result = (TRIPBFileDescriptor *)TRITrifactorTypesRoot_FileDescriptor_descriptor;
  if (!TRITrifactorTypesRoot_FileDescriptor_descriptor)
  {
    uint64_t result = [[TRIPBFileDescriptor alloc] initWithPackage:@"TRI" objcPrefix:@"TRI" syntax:2];
    TRITrifactorTypesRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

uint64_t RaiseException(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([a2 length])
  {
    BOOL v9 = @"Reason";
    v10[0] = a2;
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    uint64_t v4 = 0;
  }
  int v7 = @"TRIPBCodedInputStreamUnderlyingErrorKey";
  uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIPBCodedInputStreamErrorDomain" code:a1 userInfo:v4];
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", @"TRIPBCodedInputStreamException", a2, v5), "raise");
}

uint64_t __ResolveIvarGet_block_invoke_16(uint64_t a1, uint64_t a2)
{
  return TRIPBGetObjectIvarWithField(a2, *(void **)(a1 + 32));
}

uint64_t __ResolveIvarGet_block_invoke_18(uint64_t a1, void *a2)
{
  return TRIPBGetMessageEnumField(a2, *(void **)(a1 + 32));
}

uint64_t __ResolveIvarGet_block_invoke_15(uint64_t a1, uint64_t a2)
{
  return TRIPBGetObjectIvarWithField(a2, *(void **)(a1 + 32));
}

void *__ResolveIvarSet_block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(unsigned __int8 *)(a1 + 40);
  id v6 = a3;
  return TRIPBSetRetainedObjectIvarWithFieldInternal(a2, v4, v6, v5);
}

unint64_t TRIProject_ProjectId_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRIProject_ProjectId_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRIProject_ProjectId" valueNames:"UnknownClient" values:&TRIProject_ProjectId_EnumDescriptor_values count:176 enumVerifier:TRIProject_ProjectId_IsValidValue extraTextFormatInfo:&unk_19362D0A8];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRIProject_ProjectId_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRIProject_ProjectId_EnumDescriptor_descriptor);
}

TRIPBFileDescriptor *TRITrinamespaceRoot_FileDescriptor()
{
  uint64_t result = (TRIPBFileDescriptor *)TRITrinamespaceRoot_FileDescriptor_descriptor;
  if (!TRITrinamespaceRoot_FileDescriptor_descriptor)
  {
    uint64_t result = [[TRIPBFileDescriptor alloc] initWithPackage:@"TRI" objcPrefix:@"TRI" syntax:2];
    TRITrinamespaceRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

SEL SelFromStrings(char *__s, char *str, const char *a3, int a4)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (!__s && !a3 && (a4 & 1) == 0)
  {
    return sel_getUid(str);
  }
  if (__s) {
    size_t v9 = strlen(__s);
  }
  else {
    size_t v9 = 0;
  }
  size_t v10 = strlen(str);
  size_t v12 = v10;
  if (a3)
  {
    size_t v10 = strlen(a3);
    size_t v13 = v10;
  }
  else
  {
    size_t v13 = 0;
  }
  v20[0] = v20;
  size_t v14 = v12 + v9 + v13;
  uint64_t v15 = 1;
  if (a4) {
    uint64_t v15 = 2;
  }
  size_t v16 = v14 + v15;
  MEMORY[0x1F4188790](v10, v11);
  uint64_t v18 = (char *)v20 - v17;
  uint64_t v19 = (char *)v20 - v17;
  if (!__s)
  {
    memcpy(v19, str, v12);
    if (!a3) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  memcpy(v19, __s, v9);
  memcpy((void *)&v18[v9], str, v12);
  v18[v9] = __toupper(v18[v9]);
  if (a3) {
LABEL_17:
  }
    memcpy((void *)&v18[v9 + v12], a3, v13);
LABEL_18:
  if (a4) {
    v18[v14] = 58;
  }
  v18[v16 - 1] = 0;
  return sel_getUid(v18);
}

unint64_t TRINamespace_NamespaceId_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRINamespace_NamespaceId_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRINamespace_NamespaceId" valueNames:"UnknownNamespace" values:&TRINamespace_NamespaceId_EnumDescriptor_values count:439 enumVerifier:TRINamespace_NamespaceId_IsValidValue extraTextFormatInfo:&unk_193630230];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRINamespace_NamespaceId_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRINamespace_NamespaceId_EnumDescriptor_descriptor);
}

unint64_t TRIFactor_FactorType_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRIFactor_FactorType_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRIFactor_FactorType" valueNames:"Unknown" values:&TRIFactor_FactorType_EnumDescriptor_values count:11 enumVerifier:TRIFactor_FactorType_IsValidValue];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRIFactor_FactorType_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRIFactor_FactorType_EnumDescriptor_descriptor);
}

BOOL TRIProject_ProjectId_IsValidValue(unsigned int a1)
{
  BOOL result = 1;
  if (a1 - 230 >= 0x79 && a1 - 100 >= 0x26 && (a1 - 200 > 0x1B || ((1 << (a1 + 56)) & 0xFF00C03) == 0)) {
    return a1 < 5;
  }
  return result;
}

char *TRIPBMessageEncodingForSelector(const char *a1, BOOL a2)
{
  Protocol = objc_getProtocol("TRIPBMessageSignatureProtocol");
  if (!Protocol)
  {
    uint64_t v8 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "const char *TRIPBMessageEncodingForSelector(SEL, BOOL)"), @"TRIPBUtilities.m", 1491, @"Missing TRIPBMessageSignatureProtocol");
  }
  objc_method_description MethodDescription = protocol_getMethodDescription(Protocol, a1, 0, a2);
  if (MethodDescription.name) {
    BOOL v6 = MethodDescription.types == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    size_t v9 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "const char *TRIPBMessageEncodingForSelector(SEL, BOOL)"), @"TRIPBUtilities.m", 1495, @"Missing method for selector %@", NSStringFromSelector(a1) file lineNumber description];
  }
  return MethodDescription.types;
}

uint64_t __ResolveIvarGet_block_invoke_13(uint64_t a1, uint64_t a2)
{
  return TRIPBGetMessageUInt64Field(a2, *(void **)(a1 + 32));
}

BOOL __ResolveIvarGet_block_invoke(uint64_t a1, uint64_t a2)
{
  return TRIPBGetMessageBoolField(a2, *(void **)(a1 + 32));
}

uint64_t ErrorFromException(void *a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend((id)objc_msgSend(a1, "name"), "isEqual:", @"TRIPBCodedInputStreamException")
    || (uint64_t result = objc_msgSend((id)objc_msgSend(a1, "userInfo"), "objectForKeyedSubscript:", @"TRIPBCodedInputStreamUnderlyingErrorKey")) == 0)
  {
    int v3 = (void *)[a1 reason];
    if ([v3 length])
    {
      int v5 = @"Reason";
      v6[0] = v3;
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
    }
    else
    {
      uint64_t v4 = 0;
    }
    return [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIPBMessageErrorDomain" code:-100 userInfo:v4];
  }
  return result;
}

uint64_t TRISubjectReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t TRIPBGetMessageUInt64Field(uint64_t a1, void *a2)
{
  if (TRIPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16))) {
    return *(void *)(*(void *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
  }
  return [a2 defaultValue];
}

BOOL TRIPBGetMessageBoolField(uint64_t a1, void *a2)
{
  if (!TRIPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16))) {
    return [a2 defaultValue] & 1;
  }
  uint64_t v4 = a2[1];
  unsigned int v5 = *(_DWORD *)(v4 + 24);
  int v6 = *(_DWORD *)(v4 + 16);
  return TRIPBGetHasIvar(a1, v5, v6);
}

BOOL TRITrialExperimentFieldsReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unsigned int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 3) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t TRILogContextReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unsigned int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 48) |= 2u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_42;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_44;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_42:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_44:
        *(_DWORD *)(a1 + 32) = v19;
        goto LABEL_49;
      case 2u:
        uint64_t v24 = PBReaderReadString();
        long long v25 = *(void **)(a1 + 40);
        *(void *)(a1 + 40) = v24;

        goto LABEL_49;
      case 3u:
        long long v26 = objc_alloc_init(TRILogTime);
        uint64_t v27 = 16;
        goto LABEL_31;
      case 4u:
        long long v26 = objc_alloc_init(TRILogTime);
        uint64_t v27 = 24;
LABEL_31:
        objc_storeStrong((id *)(a1 + v27), v26);
        if PBReaderPlaceMark() && (TRILogTimeReadFrom((uint64_t)v26, a2))
        {
          PBReaderRecallMark();

LABEL_49:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 5u:
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v30 = 0;
        *(unsigned char *)(a1 + 48) |= 1u;
        while (2)
        {
          uint64_t v31 = *v3;
          unint64_t v32 = *(void *)(a2 + v31);
          if (v32 == -1 || v32 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
            *(void *)(a2 + v31) = v32 + 1;
            v30 |= (unint64_t)(v33 & 0x7F) << v28;
            if (v33 < 0)
            {
              v28 += 7;
              BOOL v14 = v29++ >= 9;
              if (v14)
              {
                uint64_t v30 = 0;
                goto LABEL_48;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v30 = 0;
        }
LABEL_48:
        *(void *)(a1 + 8) = v30;
        goto LABEL_49;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_49;
    }
  }
}

unint64_t TRICloudKitSupport_Container_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRICloudKitSupport_Container_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRICloudKitSupport_Container" valueNames:"UnknownContainer" values:&TRICloudKitSupport_Container_EnumDescriptor_values count:3 enumVerifier:TRICloudKitSupport_Container_IsValidValue];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRICloudKitSupport_Container_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRICloudKitSupport_Container_EnumDescriptor_descriptor);
}

BOOL TRICloudKitSupport_Container_IsValidValue(unsigned int a1)
{
  return a1 < 3;
}

unint64_t TRICloudKitSupport_NotificationPriority_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRICloudKitSupport_NotificationPriority_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRICloudKitSupport_NotificationPriority" valueNames:"Default" values:&TRICloudKitSupport_NotificationPriority_EnumDescriptor_values count:3 enumVerifier:TRICloudKitSupport_NotificationPriority_IsValidValue];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRICloudKitSupport_NotificationPriority_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRICloudKitSupport_NotificationPriority_EnumDescriptor_descriptor);
}

BOOL TRICloudKitSupport_NotificationPriority_IsValidValue(unsigned int a1)
{
  return a1 < 3;
}

unint64_t TRICloudKitSupport_NotificationStatus_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRICloudKitSupport_NotificationStatus_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRICloudKitSupport_NotificationStatus" valueNames:"Inactive" values:&TRICloudKitSupport_NotificationStatus_EnumDescriptor_values count:2 enumVerifier:TRICloudKitSupport_NotificationStatus_IsValidValue];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRICloudKitSupport_NotificationStatus_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRICloudKitSupport_NotificationStatus_EnumDescriptor_descriptor);
}

BOOL TRICloudKitSupport_NotificationStatus_IsValidValue(unsigned int a1)
{
  return a1 < 2;
}

unint64_t TRICloudKitSupport_NotificationType_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRICloudKitSupport_NotificationType_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRICloudKitSupport_NotificationType" valueNames:"Unknown" values:&TRICloudKitSupport_NotificationType_EnumDescriptor_values count:8 enumVerifier:TRICloudKitSupport_NotificationType_IsValidValue];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRICloudKitSupport_NotificationType_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRICloudKitSupport_NotificationType_EnumDescriptor_descriptor);
}

BOOL TRICloudKitSupport_NotificationType_IsValidValue(unsigned int a1)
{
  return a1 < 6;
}

unint64_t TRICloudKitSupport_CloudKitEnvironment_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRICloudKitSupport_CloudKitEnvironment_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRICloudKitSupport_CloudKitEnvironment" valueNames:"UnknownEnvironment" values:&TRICloudKitSupport_CloudKitEnvironment_EnumDescriptor_values count:3 enumVerifier:TRICloudKitSupport_CloudKitEnvironment_IsValidValue];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRICloudKitSupport_CloudKitEnvironment_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRICloudKitSupport_CloudKitEnvironment_EnumDescriptor_descriptor);
}

BOOL TRICloudKitSupport_CloudKitEnvironment_IsValidValue(unsigned int a1)
{
  return a1 < 3;
}

void TRIPBExtensionMergeFromInputStream(void *a1, int a2, uint64_t *a3, uint64_t a4, void *a5)
{
  uint64_t v9 = a1[1];
  if (a2)
  {
    if ((*(unsigned char *)(v9 + 45) & 1) == 0)
    {
      size_t v16 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void TRIPBExtensionMergeFromInputStream(TRIPBExtensionDescriptor *, BOOL, TRIPBCodedInputStream *, TRIPBExtensionRegistry *, TRIPBMessage *)"), @"TRIPBExtensionInternals.m", 282, @"How was it packed if it isn't repeated?");
    }
    int RawVarint64 = ReadRawVarint64(a3 + 1);
    uint64_t v11 = a3[3];
    unint64_t v12 = a3[4];
    unint64_t v13 = v11 + RawVarint64;
    if (v13 > v12)
    {
      RaiseException(-102, 0);
      uint64_t v11 = a3[3];
    }
    a3[4] = v13;
    if (v13 != v11)
    {
      do
      {
        BOOL v14 = NewSingleValueFromInputStream(a1, a3, a4, 0);
        [a5 addExtension:a1 value:v14];
      }
      while (a3[4] != a3[3]);
    }
    a3[4] = v12;
  }
  else
  {
    if (*(unsigned char *)(v9 + 45))
    {
      char v17 = NewSingleValueFromInputStream(a1, a3, a4, 0);
      objc_msgSend(a5, "addExtension:value:", a1);
    }
    else
    {
      if (*(unsigned __int8 *)(v9 + 44) - 15 > 1) {
        int v15 = 0;
      }
      else {
        int v15 = (void *)[a5 getExistingExtension:a1];
      }
      char v17 = NewSingleValueFromInputStream(a1, a3, a4, v15);
      objc_msgSend(a5, "setExtension:value:", a1);
    }
  }
}

__CFString *NewSingleValueFromInputStream(void *a1, uint64_t *a2, uint64_t a3, void *a4)
{
  uint64_t v4 = a1[1];
  int v6 = a2 + 1;
  switch(*(unsigned char *)(v4 + 44))
  {
    case 0:
      id v12 = objc_alloc(NSNumber);
      BOOL v13 = ReadRawVarint64(v6) != 0;
      return (__CFString *)[v12 initWithBool:v13];
    case 1:
      id v15 = objc_alloc(NSNumber);
      CheckSize((uint64_t)v6, 4);
      uint64_t v16 = a2[3];
      uint64_t v17 = *(unsigned int *)(a2[1] + v16);
      a2[3] = v16 + 4;
      unsigned int v18 = v15;
      goto LABEL_22;
    case 2:
      id v19 = objc_alloc(NSNumber);
      CheckSize((uint64_t)v6, 4);
      uint64_t v20 = a2[3];
      uint64_t RawVarint64 = *(unsigned int *)(a2[1] + v20);
      a2[3] = v20 + 4;
      uint64_t v9 = v19;
      goto LABEL_36;
    case 3:
      id v21 = objc_alloc(NSNumber);
      CheckSize((uint64_t)v6, 4);
      uint64_t v22 = a2[3];
      LODWORD(v23) = *(_DWORD *)(a2[1] + v22);
      a2[3] = v22 + 4;
      return (__CFString *)[v21 initWithFloat:v23];
    case 4:
      id v24 = objc_alloc(NSNumber);
      CheckSize((uint64_t)v6, 8);
      uint64_t v25 = a2[3];
      uint64_t v26 = *(void *)(a2[1] + v25);
      a2[3] = v25 + 8;
      uint64_t v27 = v24;
      goto LABEL_40;
    case 5:
      id v28 = objc_alloc(NSNumber);
      CheckSize((uint64_t)v6, 8);
      uint64_t v29 = a2[3];
      uint64_t v30 = *(void *)(a2[1] + v29);
      a2[3] = v29 + 8;
      uint64_t v31 = v28;
      goto LABEL_18;
    case 6:
      id v36 = objc_alloc(NSNumber);
      CheckSize((uint64_t)v6, 8);
      uint64_t v37 = a2[3];
      double v38 = *(double *)(a2[1] + v37);
      a2[3] = v37 + 8;
      return (__CFString *)[v36 initWithDouble:v38];
    case 7:
    case 0x11:
      id v7 = objc_alloc(NSNumber);
      uint64_t RawVarint64 = ReadRawVarint64(v6);
      uint64_t v9 = v7;
      goto LABEL_36;
    case 8:
      id v32 = objc_alloc(NSNumber);
      uint64_t v30 = ReadRawVarint64(v6);
      goto LABEL_17;
    case 9:
      id v39 = objc_alloc(NSNumber);
      unsigned int v40 = ReadRawVarint64(v6);
      uint64_t RawVarint64 = -(v40 & 1) ^ (v40 >> 1);
      uint64_t v9 = v39;
LABEL_36:
      return (__CFString *)[v9 initWithInt:RawVarint64];
    case 0xA:
      id v32 = objc_alloc(NSNumber);
      unint64_t v33 = ReadRawVarint64(v6);
      uint64_t v30 = -(uint64_t)(v33 & 1) ^ (v33 >> 1);
LABEL_17:
      uint64_t v31 = v32;
LABEL_18:
      return (__CFString *)[v31 initWithLongLong:v30];
    case 0xB:
      id v34 = objc_alloc(NSNumber);
      uint64_t v17 = ReadRawVarint64(v6);
      unsigned int v18 = v34;
LABEL_22:
      return (__CFString *)[v18 initWithUnsignedInt:v17];
    case 0xC:
      id v41 = objc_alloc(NSNumber);
      uint64_t v26 = ReadRawVarint64(v6);
      uint64_t v27 = v41;
LABEL_40:
      return (__CFString *)[v27 initWithUnsignedLongLong:v26];
    case 0xD:
      return (__CFString *)TRIPBCodedInputStreamReadRetainedBytes(a2 + 1);
    case 0xE:
      return TRIPBCodedInputStreamReadRetainedString(a2 + 1);
    case 0xF:
    case 0x10:
      if (a4) {
        id v11 = a4;
      }
      else {
        id v11 = objc_alloc_init((Class)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "msgClass"), "descriptor"), "messageClass"));
      }
      id v35 = v11;
      if (*(unsigned char *)(v4 + 44) == 16)
      {
        [a2 readGroup:*(unsigned int *)(v4 + 40) message:v11 extensionRegistry:a3];
      }
      else if ((*(unsigned char *)(v4 + 45) & 4) != 0)
      {
        [v11 mergeFromCodedInputStream:a2 extensionRegistry:a3];
      }
      else
      {
        [a2 readMessage:v11 extensionRegistry:a3];
      }
      return (__CFString *)v35;
    default:
      return 0;
  }
}

void *TRIPBWriteExtensionValueToOutputStream(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 8);
  if (*(unsigned char *)(v5 + 45))
  {
    if ((*(unsigned char *)(v5 + 45) & 2) != 0)
    {
      [a3 writeTag:*(unsigned int *)(v5 + 40) format:2];
      unint64_t v10 = *(char *)(v5 + 44);
      if (v10 > 6)
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v13 = [a2 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v12 = 0;
          uint64_t v15 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v25 != v15) {
                objc_enumerationMutation(a2);
              }
              v12 += ComputePBSerializedSizeNoTagOfObject(*(unsigned __int8 *)(v5 + 44), *(void **)(*((void *)&v24 + 1) + 8 * i));
            }
            uint64_t v14 = [a2 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v14);
        }
        else
        {
          uint64_t v12 = 0;
        }
      }
      else
      {
        uint64_t v11 = qword_19362C270[v10];
        uint64_t v12 = [a2 count] * v11;
      }
      [a3 writeRawVarintSizeTAs32:v12];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t result = (void *)[a2 countByEnumeratingWithState:&v20 objects:&v28 count:16];
      if (result)
      {
        uint64_t v17 = result;
        uint64_t v18 = *(void *)v21;
        do
        {
          id v19 = 0;
          do
          {
            if (*(void *)v21 != v18) {
              objc_enumerationMutation(a2);
            }
            switch(*(unsigned char *)(v5 + 44))
            {
              case 0:
                objc_msgSend(a3, "writeBoolNoTag:", objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)v19), "BOOLValue"));
                break;
              case 1:
                objc_msgSend(a3, "writeFixed32NoTag:", objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)v19), "unsignedIntValue"));
                break;
              case 2:
                objc_msgSend(a3, "writeSFixed32NoTag:", objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)v19), "intValue"));
                break;
              case 3:
                [*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) floatValue];
                objc_msgSend(a3, "writeFloatNoTag:");
                break;
              case 4:
                objc_msgSend(a3, "writeFixed64NoTag:", objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)v19), "unsignedLongLongValue"));
                break;
              case 5:
                objc_msgSend(a3, "writeSFixed64NoTag:", objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)v19), "longLongValue"));
                break;
              case 6:
                [*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) doubleValue];
                objc_msgSend(a3, "writeDoubleNoTag:");
                break;
              case 7:
                objc_msgSend(a3, "writeInt32NoTag:", objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)v19), "intValue"));
                break;
              case 8:
                objc_msgSend(a3, "writeInt64NoTag:", objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)v19), "longLongValue"));
                break;
              case 9:
                objc_msgSend(a3, "writeSInt32NoTag:", objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)v19), "intValue"));
                break;
              case 0xA:
                objc_msgSend(a3, "writeSInt64NoTag:", objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)v19), "longLongValue"));
                break;
              case 0xB:
                objc_msgSend(a3, "writeUInt32NoTag:", objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)v19), "unsignedIntValue"));
                break;
              case 0xC:
                objc_msgSend(a3, "writeUInt64NoTag:", objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)v19), "unsignedLongLongValue"));
                break;
              case 0xD:
                [a3 writeBytesNoTag:*(void *)(*((void *)&v20 + 1) + 8 * (void)v19)];
                break;
              case 0xE:
                [a3 writeStringNoTag:*(void *)(*((void *)&v20 + 1) + 8 * (void)v19)];
                break;
              case 0xF:
                [a3 writeMessageNoTag:*(void *)(*((void *)&v20 + 1) + 8 * (void)v19)];
                break;
              case 0x10:
                [a3 writeGroupNoTag:*(unsigned int *)(v5 + 40) value:*(void *)(*((void *)&v20 + 1) + 8 * (void)v19)];
                break;
              case 0x11:
                objc_msgSend(a3, "writeEnumNoTag:", objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)v19), "intValue"));
                break;
              default:
                break;
            }
            id v19 = (char *)v19 + 1;
          }
          while (v17 != v19);
          uint64_t result = (void *)[a2 countByEnumeratingWithState:&v20 objects:&v28 count:16];
          uint64_t v17 = result;
        }
        while (result);
      }
    }
    else
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t result = (void *)[a2 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (result)
      {
        id v7 = result;
        uint64_t v8 = *(void *)v29;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v29 != v8) {
              objc_enumerationMutation(a2);
            }
            WriteObjectIncludingTagToCodedOutputStream(*(void **)(*((void *)&v28 + 1) + 8 * (void)v9), v5, a3);
            uint64_t v9 = (char *)v9 + 1;
          }
          while (v7 != v9);
          uint64_t result = (void *)[a2 countByEnumeratingWithState:&v28 objects:v32 count:16];
          id v7 = result;
        }
        while (result);
      }
    }
  }
  else
  {
    return WriteObjectIncludingTagToCodedOutputStream(a2, v5, a3);
  }
  return result;
}

void *WriteObjectIncludingTagToCodedOutputStream(void *result, uint64_t a2, void *a3)
{
  switch(*(unsigned char *)(a2 + 44))
  {
    case 0:
      uint64_t v4 = *(unsigned int *)(a2 + 40);
      uint64_t v5 = [result BOOLValue];
      uint64_t result = (void *)[a3 writeBool:v4 value:v5];
      break;
    case 1:
      uint64_t v18 = *(unsigned int *)(a2 + 40);
      uint64_t v19 = [result unsignedIntValue];
      uint64_t result = (void *)[a3 writeFixed32:v18 value:v19];
      break;
    case 2:
      uint64_t v6 = *(unsigned int *)(a2 + 40);
      uint64_t v7 = [result intValue];
      uint64_t result = (void *)[a3 writeSFixed32:v6 value:v7];
      break;
    case 3:
      uint64_t v20 = *(unsigned int *)(a2 + 40);
      [result floatValue];
      uint64_t result = objc_msgSend(a3, "writeFloat:value:", v20);
      break;
    case 4:
      uint64_t v8 = *(unsigned int *)(a2 + 40);
      uint64_t v9 = [result unsignedLongLongValue];
      uint64_t result = (void *)[a3 writeFixed64:v8 value:v9];
      break;
    case 5:
      uint64_t v21 = *(unsigned int *)(a2 + 40);
      uint64_t v22 = [result longLongValue];
      uint64_t result = (void *)[a3 writeSFixed64:v21 value:v22];
      break;
    case 6:
      uint64_t v23 = *(unsigned int *)(a2 + 40);
      [result doubleValue];
      uint64_t result = objc_msgSend(a3, "writeDouble:value:", v23);
      break;
    case 7:
      uint64_t v24 = *(unsigned int *)(a2 + 40);
      uint64_t v25 = [result intValue];
      uint64_t result = (void *)[a3 writeInt32:v24 value:v25];
      break;
    case 8:
      uint64_t v26 = *(unsigned int *)(a2 + 40);
      uint64_t v27 = [result longLongValue];
      uint64_t result = (void *)[a3 writeInt64:v26 value:v27];
      break;
    case 9:
      uint64_t v10 = *(unsigned int *)(a2 + 40);
      uint64_t v11 = [result intValue];
      uint64_t result = (void *)[a3 writeSInt32:v10 value:v11];
      break;
    case 0xA:
      uint64_t v28 = *(unsigned int *)(a2 + 40);
      uint64_t v29 = [result longLongValue];
      uint64_t result = (void *)[a3 writeSInt64:v28 value:v29];
      break;
    case 0xB:
      uint64_t v12 = *(unsigned int *)(a2 + 40);
      uint64_t v13 = [result unsignedIntValue];
      uint64_t result = (void *)[a3 writeUInt32:v12 value:v13];
      break;
    case 0xC:
      uint64_t v14 = *(unsigned int *)(a2 + 40);
      uint64_t v15 = [result unsignedLongLongValue];
      uint64_t result = (void *)[a3 writeUInt64:v14 value:v15];
      break;
    case 0xD:
      uint64_t v30 = *(unsigned int *)(a2 + 40);
      uint64_t result = (void *)[a3 writeBytes:v30 value:result];
      break;
    case 0xE:
      uint64_t v16 = *(unsigned int *)(a2 + 40);
      uint64_t result = (void *)[a3 writeString:v16 value:result];
      break;
    case 0xF:
      uint64_t v31 = *(unsigned int *)(a2 + 40);
      if ((*(unsigned char *)(a2 + 45) & 4) != 0)
      {
        uint64_t result = (void *)[a3 writeMessageSetExtension:v31 value:result];
      }
      else
      {
        uint64_t result = (void *)[a3 writeMessage:v31 value:result];
      }
      break;
    case 0x10:
      uint64_t v17 = *(unsigned int *)(a2 + 40);
      uint64_t result = (void *)[a3 writeGroup:v17 value:result];
      break;
    case 0x11:
      uint64_t v32 = *(unsigned int *)(a2 + 40);
      uint64_t v33 = [result intValue];
      uint64_t result = (void *)[a3 writeEnum:v32 value:v33];
      break;
    default:
      return result;
  }
  return result;
}

uint64_t TRIPBComputeExtensionSerializedSizeIncludingTag(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 8);
  if (*(unsigned char *)(v3 + 45))
  {
    if ((*(unsigned char *)(v3 + 45) & 2) != 0)
    {
      unint64_t v11 = *(char *)(v3 + 44);
      if (v11 > 6)
      {
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v14 = [a2 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v13 = 0;
          uint64_t v16 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v27 != v16) {
                objc_enumerationMutation(a2);
              }
              v13 += ComputePBSerializedSizeNoTagOfObject(*(unsigned __int8 *)(v3 + 44), *(void **)(*((void *)&v26 + 1) + 8 * i));
            }
            uint64_t v15 = [a2 countByEnumeratingWithState:&v26 objects:v30 count:16];
          }
          while (v15);
        }
        else
        {
          uint64_t v13 = 0;
        }
      }
      else
      {
        uint64_t v12 = qword_19362C270[v11];
        uint64_t v13 = [a2 count] * v12;
      }
      unsigned int v18 = 8 * *(_DWORD *)(v3 + 40);
      if (v18 >= 0x80)
      {
        if (v18 >= 0x4000)
        {
          uint64_t v20 = 4;
          if (v18 >> 28) {
            uint64_t v20 = 5;
          }
          if (v18 >= 0x200000) {
            uint64_t v19 = v20;
          }
          else {
            uint64_t v19 = 3;
          }
        }
        else
        {
          uint64_t v19 = 2;
        }
      }
      else
      {
        uint64_t v19 = 1;
      }
      uint64_t v21 = v19 + v13;
      uint64_t v22 = 1;
      uint64_t v23 = 2;
      uint64_t v24 = 3;
      uint64_t v25 = 4;
      if (v13 >> 28) {
        uint64_t v25 = 5;
      }
      if (v13 >= 0x200000) {
        uint64_t v24 = v25;
      }
      if (v13 >= 0x4000) {
        uint64_t v23 = v24;
      }
      if (v13 >= 0x80) {
        uint64_t v22 = v23;
      }
      return v21 + v22;
    }
    else
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v6 = [a2 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = 0;
        uint64_t v9 = *(void *)v27;
        do
        {
          for (uint64_t j = 0; j != v7; ++j)
          {
            if (*(void *)v27 != v9) {
              objc_enumerationMutation(a2);
            }
            v8 += ComputeSerializedSizeIncludingTagOfObject(v3, *(void **)(*((void *)&v26 + 1) + 8 * j));
          }
          uint64_t v7 = [a2 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v7);
      }
      else
      {
        return 0;
      }
    }
    return v8;
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 8);
    return ComputeSerializedSizeIncludingTagOfObject(v4, a2);
  }
}

uint64_t ComputeSerializedSizeIncludingTagOfObject(uint64_t result, void *a2)
{
  switch(*(unsigned char *)(result + 44))
  {
    case 0:
      int v2 = *(_DWORD *)(result + 40);
      [a2 BOOLValue];
      unsigned int v3 = 8 * v2;
      if ((8 * v2) < 0x80) {
        return 2;
      }
      if (v3 < 0x4000) {
        return 3;
      }
      if (v3 >= 0x200000)
      {
        BOOL v32 = v3 >> 28 == 0;
        uint64_t v33 = 5;
        goto LABEL_80;
      }
      return 4;
    case 1:
      int v4 = *(_DWORD *)(result + 40);
      [a2 unsignedIntValue];
      goto LABEL_27;
    case 2:
      int v4 = *(_DWORD *)(result + 40);
      [a2 intValue];
      goto LABEL_27;
    case 3:
      int v4 = *(_DWORD *)(result + 40);
      [a2 floatValue];
LABEL_27:
      unsigned int v19 = 8 * v4;
      if ((8 * v4) < 0x80) {
        return 5;
      }
      if (v19 < 0x4000) {
        return 6;
      }
      if (v19 < 0x200000) {
        return 7;
      }
      BOOL v32 = v19 >> 28 == 0;
      uint64_t v33 = 8;
      goto LABEL_80;
    case 4:
      int v5 = *(_DWORD *)(result + 40);
      [a2 unsignedLongLongValue];
      goto LABEL_33;
    case 5:
      int v5 = *(_DWORD *)(result + 40);
      [a2 longLongValue];
      goto LABEL_33;
    case 6:
      int v5 = *(_DWORD *)(result + 40);
      [a2 doubleValue];
LABEL_33:
      unsigned int v20 = 8 * v5;
      if ((8 * v5) < 0x80) {
        return 9;
      }
      if (v20 < 0x4000) {
        return 10;
      }
      if (v20 < 0x200000) {
        return 11;
      }
      BOOL v32 = v20 >> 28 == 0;
      uint64_t v33 = 12;
LABEL_80:
      if (v32) {
        return v33;
      }
      else {
        return v33 + 1;
      }
    case 7:
      int v6 = *(_DWORD *)(result + 40);
      unsigned int v7 = [a2 intValue];
      return TRIPBComputeInt32Size(v6, v7);
    case 8:
      int v12 = *(_DWORD *)(result + 40);
      unint64_t v13 = [a2 longLongValue];
      goto LABEL_38;
    case 9:
      int v8 = *(_DWORD *)(result + 40);
      int v9 = [a2 intValue];
      return TRIPBComputeSInt32Size(v8, v9);
    case 0xA:
      int v25 = *(_DWORD *)(result + 40);
      uint64_t v26 = [a2 longLongValue];
      return TRIPBComputeSInt64Size(v25, v26);
    case 0xB:
      int v10 = *(_DWORD *)(result + 40);
      unsigned int v11 = [a2 unsignedIntValue];
      return TRIPBComputeUInt32Size(v10, v11);
    case 0xC:
      int v12 = *(_DWORD *)(result + 40);
      unint64_t v13 = [a2 unsignedLongLongValue];
LABEL_38:
      unsigned int v21 = 8 * v12;
      if ((8 * v12) >= 0x80)
      {
        uint64_t v22 = 3;
        uint64_t v23 = 4;
        if (v21 >> 28) {
          uint64_t v23 = 5;
        }
        if (v21 >= 0x200000) {
          uint64_t v22 = v23;
        }
        if (v21 >= 0x4000) {
          uint64_t v18 = v22;
        }
        else {
          uint64_t v18 = 2;
        }
      }
      else
      {
        uint64_t v18 = 1;
      }
      uint64_t v24 = TRIPBComputeRawVarint64Size(v13);
      return v24 + v18;
    case 0xD:
      int v27 = *(_DWORD *)(result + 40);
      return TRIPBComputeBytesSize(v27, a2);
    case 0xE:
      int v14 = *(_DWORD *)(result + 40);
      return TRIPBComputeStringSize(v14, a2);
    case 0xF:
      char v15 = *(unsigned char *)(result + 45);
      unsigned int v16 = *(_DWORD *)(result + 40);
      if ((v15 & 4) != 0)
      {
        return TRIPBComputeMessageSetExtensionSize(v16, a2);
      }
      else
      {
        return TRIPBComputeMessageSize(v16, a2);
      }
    case 0x10:
      unsigned int v17 = 8 * *(_DWORD *)(result + 40);
      if (v17 >= 0x80)
      {
        uint64_t v30 = 6;
        uint64_t v31 = 10;
        if (!(v17 >> 28)) {
          uint64_t v31 = 8;
        }
        if (v17 >= 0x200000) {
          uint64_t v30 = v31;
        }
        if (v17 >= 0x4000) {
          uint64_t v18 = v30;
        }
        else {
          uint64_t v18 = 4;
        }
      }
      else
      {
        uint64_t v18 = 2;
      }
      uint64_t v24 = [a2 serializedSize];
      return v24 + v18;
    case 0x11:
      int v28 = *(_DWORD *)(result + 40);
      unsigned int v29 = [a2 intValue];
      return TRIPBComputeEnumSize(v28, v29);
    default:
      return result;
  }
}

uint64_t ComputePBSerializedSizeNoTagOfObject(uint64_t result, void *a2)
{
  switch((int)result)
  {
    case 0:
      [a2 BOOLValue];
      return 1;
    case 1:
      [a2 unsignedIntValue];
      return 4;
    case 2:
      [a2 intValue];
      return 4;
    case 3:
      [a2 floatValue];
      return 4;
    case 4:
      [a2 unsignedLongLongValue];
      return 8;
    case 5:
      [a2 longLongValue];
      return 8;
    case 6:
      [a2 doubleValue];
      return 8;
    case 7:
      unsigned int v5 = [a2 intValue];
      uint64_t v6 = 1;
      uint64_t v7 = 2;
      uint64_t v8 = 3;
      uint64_t v9 = 4;
      if (v5 >> 28) {
        uint64_t v9 = 5;
      }
      if (v5 >= 0x200000) {
        uint64_t v8 = v9;
      }
      if (v5 >= 0x4000) {
        uint64_t v7 = v8;
      }
      if (v5 >= 0x80) {
        uint64_t v6 = v7;
      }
      if ((v5 & 0x80000000) == 0) {
        return v6;
      }
      else {
        return 10;
      }
    case 8:
      unint64_t v3 = [a2 longLongValue];
      goto LABEL_32;
    case 9:
      int v10 = [a2 intValue];
      unsigned int v11 = (2 * v10) ^ (v10 >> 31);
      if (v11 < 0x80) {
        return 1;
      }
      if (v11 < 0x4000) {
        return 2;
      }
      uint64_t v20 = 4;
      if (v11 >> 28) {
        uint64_t v20 = 5;
      }
      if (v11 >= 0x200000) {
        return v20;
      }
      else {
        return 3;
      }
    case 10:
      uint64_t v12 = [a2 longLongValue];
      unint64_t v3 = (2 * v12) ^ (v12 >> 63);
      goto LABEL_32;
    case 11:
      unsigned int v2 = [a2 unsignedIntValue];
      goto LABEL_47;
    case 12:
      unint64_t v3 = [a2 unsignedLongLongValue];
LABEL_32:
      return TRIPBComputeRawVarint64Size(v3);
    case 13:
      uint64_t v4 = [a2 length];
      goto LABEL_37;
    case 14:
      uint64_t v4 = [a2 lengthOfBytesUsingEncoding:4];
      goto LABEL_37;
    case 15:
      uint64_t v4 = [a2 serializedSize];
LABEL_37:
      uint64_t v13 = 1;
      uint64_t v14 = 2;
      uint64_t v15 = 3;
      uint64_t v16 = 4;
      if (v4 >> 28) {
        uint64_t v16 = 5;
      }
      if (v4 >= 0x200000) {
        uint64_t v15 = v16;
      }
      if (v4 >= 0x4000) {
        uint64_t v14 = v15;
      }
      if (v4 >= 0x80) {
        uint64_t v13 = v14;
      }
      uint64_t result = v13 + v4;
      break;
    case 16:
      uint64_t result = [a2 serializedSize];
      break;
    case 17:
      unsigned int v2 = [a2 intValue];
LABEL_47:
      uint64_t v17 = 2;
      uint64_t v18 = 3;
      uint64_t v19 = 4;
      if (v2 >> 28) {
        uint64_t v19 = 5;
      }
      if (v2 >= 0x200000) {
        uint64_t v18 = v19;
      }
      if (v2 >= 0x4000) {
        uint64_t v17 = v18;
      }
      if (v2 >= 0x80) {
        uint64_t result = v17;
      }
      else {
        uint64_t result = 1;
      }
      break;
    default:
      return result;
  }
  return result;
}

uint64_t TRILogTreatmentReadFrom(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unsigned int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    int v16 = v10 & 7;
    if (v15 || v16 == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 40;
        goto LABEL_23;
      case 2u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 64;
LABEL_23:
        uint64_t v20 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_64;
      case 3u:
        if (v16 == 2)
        {
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
          {
            char v22 = 0;
            unsigned int v23 = 0;
            uint64_t v24 = 0;
            while (1)
            {
              uint64_t v25 = *v3;
              unint64_t v26 = *(void *)(a2 + v25);
              if (v26 == -1 || v26 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v26);
              *(void *)(a2 + v25) = v26 + 1;
              v24 |= (unint64_t)(v27 & 0x7F) << v22;
              if (v27 < 0)
              {
                v22 += 7;
                BOOL v14 = v23++ >= 9;
                if (!v14) {
                  continue;
                }
              }
              goto LABEL_36;
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_36:
            PBRepeatedUInt32Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v37 = 0;
          while (1)
          {
            uint64_t v38 = *v3;
            unint64_t v39 = *(void *)(a2 + v38);
            if (v39 == -1 || v39 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v40 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
            *(void *)(a2 + v38) = v39 + 1;
            v37 |= (unint64_t)(v40 & 0x7F) << v35;
            if (v40 < 0)
            {
              v35 += 7;
              BOOL v14 = v36++ >= 9;
              if (!v14) {
                continue;
              }
            }
            goto LABEL_63;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_63:
          PBRepeatedUInt32Add();
        }
        goto LABEL_64;
      case 4u:
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v30 = 0;
        *(unsigned char *)(a1 + 72) |= 1u;
        while (2)
        {
          uint64_t v31 = *v3;
          unint64_t v32 = *(void *)(a2 + v31);
          if (v32 == -1 || v32 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
            *(void *)(a2 + v31) = v32 + 1;
            v30 |= (unint64_t)(v33 & 0x7F) << v28;
            if (v33 < 0)
            {
              v28 += 7;
              BOOL v14 = v29++ >= 9;
              if (v14)
              {
                LODWORD(v30) = 0;
                goto LABEL_53;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v30) = 0;
        }
LABEL_53:
        *(_DWORD *)(a1 + 32) = v30;
        goto LABEL_64;
      case 5u:
        PBReaderReadString();
        id v34 = (TRILogNamespace *)objc_claimAutoreleasedReturnValue();
        if (v34) {
          [(id)a1 addNamespaceName:v34];
        }
        goto LABEL_49;
      case 6u:
        id v34 = objc_alloc_init(TRILogNamespace);
        [(id)a1 addNamespace:v34];
        if PBReaderPlaceMark() && (TRILogNamespaceReadFrom((uint64_t)v34, a2))
        {
          PBReaderRecallMark();
LABEL_49:

LABEL_64:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_64;
    }
  }
}

uint64_t TRITrialSystemTelemetryReadFrom(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unsigned int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 48;
        goto LABEL_56;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 40;
        goto LABEL_56;
      case 3u:
        uint64_t v19 = objc_alloc_init(TRITrialExperimentFields);
        objc_storeStrong((id *)(a1 + 80), v19);
        if (!PBReaderPlaceMark() || !TRITrialExperimentFieldsReadFrom((uint64_t)v19, a2)) {
          goto LABEL_77;
        }
        goto LABEL_69;
      case 4u:
        uint64_t v19 = objc_alloc_init(TRITrialRolloutFields);
        objc_storeStrong((id *)(a1 + 160), v19);
        if (!PBReaderPlaceMark() || (TRITrialRolloutFieldsReadFrom((uint64_t)v19, a2) & 1) == 0) {
          goto LABEL_77;
        }
        goto LABEL_69;
      case 5u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 24;
        goto LABEL_56;
      case 6u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 168;
        goto LABEL_56;
      case 7u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 144;
        goto LABEL_56;
      case 8u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 112;
        goto LABEL_56;
      case 9u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 136;
        goto LABEL_56;
      case 0xAu:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 152;
        goto LABEL_56;
      case 0xBu:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 32;
        goto LABEL_56;
      case 0xDu:
        uint64_t v19 = objc_alloc_init(TRITrialFactorFields);
        objc_storeStrong((id *)(a1 + 88), v19);
        if (!PBReaderPlaceMark() || !TRITrialFactorFieldsReadFrom((uint64_t)v19, a2)) {
          goto LABEL_77;
        }
        goto LABEL_69;
      case 0xEu:
        uint64_t v19 = objc_alloc_init(TRITrialDownloadSettingsFields);
        objc_storeStrong((id *)(a1 + 64), v19);
        if (!PBReaderPlaceMark() || (TRITrialDownloadSettingsFieldsReadFrom((uint64_t)v19, a2) & 1) == 0) {
          goto LABEL_77;
        }
        goto LABEL_69;
      case 0xFu:
        uint64_t v19 = objc_alloc_init(TRITrialCloudKitContainerOriginFields);
        objc_storeStrong((id *)(a1 + 56), v19);
        if (!PBReaderPlaceMark() || !TRITrialCloudKitContainerOriginFieldsReadFrom((uint64_t)v19, a2)) {
          goto LABEL_77;
        }
        goto LABEL_69;
      case 0x10u:
        uint64_t v19 = objc_alloc_init(TRITrialAssetPurgeFields);
        objc_storeStrong((id *)(a1 + 8), v19);
        if (!PBReaderPlaceMark() || (TRITrialAssetPurgeFieldsReadFrom((uint64_t)v19, a2) & 1) == 0) {
          goto LABEL_77;
        }
        goto LABEL_69;
      case 0x11u:
        uint64_t v19 = objc_alloc_init(TRITrialDownloadStatusFields);
        objc_storeStrong((id *)(a1 + 72), v19);
        if (!PBReaderPlaceMark() || (TRITrialDownloadStatusFieldsReadFrom((uint64_t)v19, a2) & 1) == 0) {
          goto LABEL_77;
        }
        goto LABEL_69;
      case 0x12u:
        uint64_t v19 = objc_alloc_init(TRITrialOnDemandFactorFields);
        objc_storeStrong((id *)(a1 + 104), v19);
        if (!PBReaderPlaceMark() || !TRITrialOnDemandFactorFieldsReadFrom((uint64_t)v19, a2)) {
          goto LABEL_77;
        }
        goto LABEL_69;
      case 0x13u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 128;
        goto LABEL_56;
      case 0x14u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 120;
LABEL_56:
        unsigned int v21 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_70;
      case 0x15u:
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v24 = 0;
        *(unsigned char *)(a1 + 180) |= 1u;
        while (2)
        {
          uint64_t v25 = *v3;
          unint64_t v26 = *(void *)(a2 + v25);
          if (v26 == -1 || v26 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v26);
            *(void *)(a2 + v25) = v26 + 1;
            v24 |= (unint64_t)(v27 & 0x7F) << v22;
            if (v27 < 0)
            {
              v22 += 7;
              BOOL v14 = v23++ >= 9;
              if (v14)
              {
                uint64_t v24 = 0;
                goto LABEL_75;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v24 = 0;
        }
LABEL_75:
        *(unsigned char *)(a1 + 176) = v24 != 0;
        goto LABEL_70;
      case 0x16u:
        uint64_t v19 = objc_alloc_init(TRITrialMobileAssetOriginFields);
        objc_storeStrong((id *)(a1 + 96), v19);
        if (!PBReaderPlaceMark() || (TRITrialMobileAssetOriginFieldsReadFrom((uint64_t)v19, a2) & 1) == 0) {
          goto LABEL_77;
        }
        goto LABEL_69;
      case 0x17u:
        uint64_t v19 = objc_alloc_init(TRITrialBMLTFields);
        objc_storeStrong((id *)(a1 + 16), v19);
        if PBReaderPlaceMark() && (TRITrialBMLTFieldsReadFrom((uint64_t)v19, a2))
        {
LABEL_69:
          PBReaderRecallMark();

LABEL_70:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_77:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_70;
    }
  }
}

BOOL TRITrialCloudKitContainerOriginFieldsReadFrom(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unsigned int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 16) |= 2u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4))
          {
            uint64_t v24 = &OBJC_IVAR___TRITrialCloudKitContainerOriginFields__ckEnvironment;
            goto LABEL_38;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            break;
          }
          v17 += 7;
          BOOL v23 = v18++ > 8;
          if (v23)
          {
            LODWORD(v19) = 0;
            uint64_t v24 = &OBJC_IVAR___TRITrialCloudKitContainerOriginFields__ckEnvironment;
            goto LABEL_41;
          }
        }
        uint64_t v24 = &OBJC_IVAR___TRITrialCloudKitContainerOriginFields__ckEnvironment;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_41:
        *(_DWORD *)(a1 + *v24) = v19;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_42:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v25 = 0;
    unsigned int v26 = 0;
    uint64_t v19 = 0;
    *(unsigned char *)(a1 + 16) |= 1u;
    while (1)
    {
      uint64_t v27 = *v3;
      unint64_t v28 = *(void *)(a2 + v27);
      if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
      *(void *)(a2 + v27) = v28 + 1;
      v19 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0)
      {
        uint64_t v24 = &OBJC_IVAR___TRITrialCloudKitContainerOriginFields__ckContainer;
        goto LABEL_39;
      }
      v25 += 7;
      BOOL v23 = v26++ > 8;
      if (v23)
      {
        LODWORD(v19) = 0;
        uint64_t v24 = &OBJC_IVAR___TRITrialCloudKitContainerOriginFields__ckContainer;
        goto LABEL_41;
      }
    }
    uint64_t v24 = &OBJC_IVAR___TRITrialCloudKitContainerOriginFields__ckContainer;
LABEL_38:
    *(unsigned char *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t TRIPBEmptyNSData()
{
  if (_MergedGlobals_6 != -1) {
    dispatch_once(&_MergedGlobals_6, &__block_literal_global);
  }
  return qword_1EB3EE4F8;
}

id __TRIPBEmptyNSData_block_invoke()
{
  id result = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
  qword_1EB3EE4F8 = (uint64_t)result;
  return result;
}

uint64_t TRIPBMessageDropUnknownFieldsRecursively(uint64_t result)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    id v1 = (void *)[MEMORY[0x1E4F1CA48] arrayWithObject:result];
    id result = [v1 count];
    if (result)
    {
      uint64_t v30 = v42;
      uint64_t v31 = v44;
      unint64_t v32 = v40;
      unint64_t v28 = v38;
      char v29 = v46;
      uint64_t v27 = v48;
      do
      {
        unsigned int v2 = objc_msgSend(v1, "lastObject", v27, v28, v29, v30, v31, v32);
        [v1 removeLastObject];
        [v2 setUnknownFields:0];
        uint64_t v3 = [(id)objc_opt_class() descriptor];
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        uint64_t v4 = *(void **)(v3 + 8);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v49 objects:v54 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v50;
          do
          {
            for (uint64_t i = 0; i != v6; ++i)
            {
              if (*(void *)v50 != v7) {
                objc_enumerationMutation(v4);
              }
              unsigned int v9 = *(void **)(*((void *)&v49 + 1) + 8 * i);
              if (*(unsigned __int8 *)(v9[1] + 30) - 15 <= 1)
              {
                int v10 = [*(id *)(*((void *)&v49 + 1) + 8 * i) fieldType];
                if (v10 == 2)
                {
                  uint64_t v15 = v2[8];
                  if (v15) {
                    int v16 = *(void **)(v15 + *(unsigned int *)(v9[1] + 24));
                  }
                  else {
                    int v16 = 0;
                  }
                  switch([v9 mapKeyDataType])
                  {
                    case 0u:
                      v47[0] = MEMORY[0x1E4F143A8];
                      v47[1] = 3221225472;
                      v48[0] = __TRIPBMessageDropUnknownFieldsRecursively_block_invoke;
                      v48[1] = &unk_1E576B918;
                      v48[2] = v1;
                      unsigned int v18 = v47;
                      goto LABEL_34;
                    case 1u:
                    case 0xBu:
                      v45[0] = MEMORY[0x1E4F143A8];
                      v45[1] = 3221225472;
                      v46[0] = __TRIPBMessageDropUnknownFieldsRecursively_block_invoke_2;
                      v46[1] = &unk_1E576B940;
                      v46[2] = v1;
                      unsigned int v18 = v45;
                      goto LABEL_34;
                    case 2u:
                    case 7u:
                    case 9u:
                      v43[0] = MEMORY[0x1E4F143A8];
                      v43[1] = 3221225472;
                      v44[0] = __TRIPBMessageDropUnknownFieldsRecursively_block_invoke_3;
                      v44[1] = &unk_1E576B968;
                      v44[2] = v1;
                      unsigned int v18 = v43;
                      goto LABEL_34;
                    case 3u:
                    case 6u:
                    case 0xDu:
                    case 0xFu:
                    case 0x10u:
                    case 0x11u:
                      char v17 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
                      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void TRIPBMessageDropUnknownFieldsRecursively(TRIPBMessage * _Nonnull)"), @"TRIPBUtilities.m", 168, @"Aren't valid key types.");
                      continue;
                    case 4u:
                    case 0xCu:
                      v41[0] = MEMORY[0x1E4F143A8];
                      v41[1] = 3221225472;
                      v42[0] = __TRIPBMessageDropUnknownFieldsRecursively_block_invoke_4;
                      v42[1] = &unk_1E576B990;
                      v42[2] = v1;
                      unsigned int v18 = v41;
                      goto LABEL_34;
                    case 5u:
                    case 8u:
                    case 0xAu:
                      v39[0] = MEMORY[0x1E4F143A8];
                      v39[1] = 3221225472;
                      v40[0] = __TRIPBMessageDropUnknownFieldsRecursively_block_invoke_5;
                      v40[1] = &unk_1E576B9B8;
                      v40[2] = v1;
                      unsigned int v18 = v39;
                      goto LABEL_34;
                    case 0xEu:
                      v37[0] = MEMORY[0x1E4F143A8];
                      v37[1] = 3221225472;
                      v38[0] = __TRIPBMessageDropUnknownFieldsRecursively_block_invoke_6;
                      v38[1] = &unk_1E576B9E0;
                      v38[2] = v1;
                      unsigned int v18 = v37;
LABEL_34:
                      [v16 enumerateKeysAndObjectsUsingBlock:v18];
                      break;
                    default:
                      continue;
                  }
                }
                else if (v10 == 1)
                {
                  uint64_t v13 = v2[8];
                  if (v13) {
                    BOOL v14 = *(void **)(v13 + *(unsigned int *)(v9[1] + 24));
                  }
                  else {
                    BOOL v14 = 0;
                  }
                  if ([v14 count]) {
                    [v1 addObjectsFromArray:v14];
                  }
                }
                else if (!v10 && TRIPBGetHasIvar((uint64_t)v2, *(_DWORD *)(v9[1] + 20), *(_DWORD *)(v9[1] + 16)))
                {
                  uint64_t v11 = v2[8];
                  if (v11) {
                    uint64_t v12 = *(void *)(v11 + *(unsigned int *)(v9[1] + 24));
                  }
                  else {
                    uint64_t v12 = 0;
                  }
                  [v1 addObject:v12];
                }
              }
            }
            uint64_t v6 = [v4 countByEnumeratingWithState:&v49 objects:v54 count:16];
          }
          while (v6);
        }
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        uint64_t v19 = (void *)[v2 extensionsCurrentlySet];
        uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v53 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v34;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v34 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void **)(*((void *)&v33 + 1) + 8 * j);
              if ([v24 dataType] - 15 <= 1)
              {
                int v25 = [v24 isRepeated];
                uint64_t v26 = [v2 getExtension:v24];
                if (v25) {
                  [v1 addObjectsFromArray:v26];
                }
                else {
                  [v1 addObject:v26];
                }
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v53 count:16];
          }
          while (v21);
        }
        id result = [v1 count];
      }
      while (result);
    }
  }
  return result;
}

uint64_t TRIPBGetObjectIvarWithFieldNoAutocreate(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2) {
    return *(void *)(v2 + *(unsigned int *)(*(void *)(a2 + 8) + 24));
  }
  else {
    return 0;
  }
}

uint64_t __TRIPBMessageDropUnknownFieldsRecursively_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __TRIPBMessageDropUnknownFieldsRecursively_block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __TRIPBMessageDropUnknownFieldsRecursively_block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __TRIPBMessageDropUnknownFieldsRecursively_block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __TRIPBMessageDropUnknownFieldsRecursively_block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __TRIPBMessageDropUnknownFieldsRecursively_block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t TRIPBCheckRuntimeVersionSupport(uint64_t result)
{
  if ((int)result >= 30003) {
    return [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Linked to ProtocolBuffer runtime version %d, but code compiled needing atleast %d!", 30002, result format];
  }
  if ((int)result <= 30000) {
    return [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Proto generation source compiled against runtime version %d, but this version of the runtime only supports back to %d!", result, 30001 format];
  }
  return result;
}

uint64_t TRIPBCheckRuntimeVersionInternal(uint64_t result)
{
  if (result != 30001) {
    return [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Linked to ProtocolBuffer runtime version %d, but code compiled with version %d!", 30001, result, v1, v2 format];
  }
  return result;
}

BOOL TRIPBMessageHasFieldNumberSet(void *a1, uint64_t a2)
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(a1, "descriptor"), "fieldWithNumber:", a2);
  return TRIPBMessageHasFieldSet((uint64_t)a1, v3);
}

BOOL TRIPBMessageHasFieldSet(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (!a1 || !a2) {
    return v2;
  }
  uint64_t v3 = *(void *)(a2 + 8);
  if ((*(_WORD *)(v3 + 28) & 0xF02) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if (v4) {
      uint64_t v5 = *(void **)(v4 + *(unsigned int *)(v3 + 24));
    }
    else {
      uint64_t v5 = 0;
    }
    return [v5 count] != 0;
  }
  int v7 = *(_DWORD *)(v3 + 16);
  unsigned int v6 = *(_DWORD *)(v3 + 20);
  return TRIPBGetHasIvar(a1, v6, v7);
}

uint64_t TRIPBClearMessageField(uint64_t a1, uint64_t a2)
{
  uint64_t result = TRIPBGetHasIvar(a1, *(_DWORD *)(*(void *)(a2 + 8) + 20), *(_DWORD *)(*(void *)(a2 + 8) + 16));
  if (result)
  {
    uint64_t v5 = *(void *)(a2 + 8);
    if ((*(_WORD *)(v5 + 28) & 0xF02) != 0 || *(unsigned __int8 *)(v5 + 30) - 13 <= 3)
    {
      uint64_t v6 = *(void *)(a1 + 64);
      uint64_t v7 = *(unsigned int *)(v5 + 24);

      *(void *)(v6 + v7) = 0;
      uint64_t v5 = *(void *)(a2 + 8);
    }
    int v9 = *(_DWORD *)(v5 + 16);
    unsigned int v8 = *(_DWORD *)(v5 + 20);
    return TRIPBSetHasIvar(a1, v8, v9, 0);
  }
  return result;
}

uint64_t TRIPBSetAutocreatedRetainedObjectIvarWithField(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(result + 64);
  uint64_t v5 = *(unsigned int *)(*(void *)(a2 + 8) + 24);
  if (*(void *)(v4 + v5))
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t result = objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void TRIPBSetAutocreatedRetainedObjectIvarWithField(TRIPBMessage *, TRIPBFieldDescriptor *, id)"), @"TRIPBUtilities.m", 467, @"Can't set autocreated object more than once.");
  }
  *(void *)(v4 + v5) = a3;
  return result;
}

void *TRIPBSetObjectIvarWithFieldInternal(void *a1, uint64_t a2, void *a3, int a4)
{
  id v7 = a3;
  return TRIPBSetRetainedObjectIvarWithFieldInternal(a1, a2, v7, a4);
}

uint64_t TRIPBGetEnumIvarWithFieldInternal(uint64_t a1, void *a2, int a3)
{
  uint64_t v5 = TRIPBGetMessageInt32Field(a1, a2);
  if (a3 == 3)
  {
    if ([a2 isValidEnumValue:v5]) {
      return v5;
    }
    else {
      return 4222467823;
    }
  }
  return v5;
}

void *TRIPBSetMessageEnumField(void *a1, uint64_t a2, int a3)
{
  int v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "descriptor"), "file"), "syntax");
  return TRIPBSetInt32IvarWithFieldInternal(a1, a2, a3, v6);
}

void *TRIPBSetEnumIvarWithFieldInternal(void *a1, void *a2, uint64_t a3, int a4)
{
  if ((objc_msgSend(a2, "isValidEnumValue:") & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@.%@: Attempt to set an unknown enum value (%d)", objc_opt_class(), objc_msgSend(a2, "name"), a3 format];
  }
  return TRIPBSetInt32IvarWithFieldInternal(a1, (uint64_t)a2, a3, a4);
}

void *TRIPBSetMessageRawEnumField(void *a1, uint64_t a2, int a3)
{
  int v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "descriptor"), "file"), "syntax");
  return TRIPBSetInt32IvarWithFieldInternal(a1, a2, a3, v6);
}

void *TRIPBSetMessageBoolField(void *result, uint64_t a2, int a3)
{
  if (result && a2)
  {
    uint64_t v5 = result;
    int v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(result, "descriptor"), "file"), "syntax");
    return TRIPBSetBoolIvarWithFieldInternal(v5, a2, a3, v6);
  }
  return result;
}

void *TRIPBSetMessageInt32Field(void *result, uint64_t a2, int a3)
{
  if (result && a2)
  {
    uint64_t v5 = result;
    int v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(result, "descriptor"), "file"), "syntax");
    return TRIPBSetInt32IvarWithFieldInternal(v5, a2, a3, v6);
  }
  return result;
}

uint64_t TRIPBGetMessageUInt32Field(uint64_t a1, void *a2)
{
  if (TRIPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16))) {
    return *(unsigned int *)(*(void *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
  }
  else {
    return [a2 defaultValue];
  }
}

void *TRIPBSetMessageUInt32Field(void *result, uint64_t a2, int a3)
{
  if (result && a2)
  {
    uint64_t v5 = result;
    int v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(result, "descriptor"), "file"), "syntax");
    return TRIPBSetUInt32IvarWithFieldInternal(v5, a2, a3, v6);
  }
  return result;
}

void *TRIPBSetUInt32IvarWithFieldInternal(void *a1, uint64_t a2, int a3, int a4)
{
  unsigned int v8 = *(void **)(a2 + 16);
  if (v8) {
    TRIPBMaybeClearOneof((uint64_t)a1, v8, *(unsigned int *)(*(void *)(a2 + 8) + 20), *(_DWORD *)(*(void *)(a2 + 8) + 16));
  }
  *(_DWORD *)(a1[8] + *(unsigned int *)(*(void *)(a2 + 8) + 24)) = a3;
  BOOL v9 = 1;
  if (!a3 && a4 != 2) {
    BOOL v9 = *(void *)(a2 + 16) != 0;
  }
  TRIPBSetHasIvar((uint64_t)a1, *(_DWORD *)(*(void *)(a2 + 8) + 20), *(_DWORD *)(*(void *)(a2 + 8) + 16), v9);
  return TRIPBBecomeVisibleToAutocreator(a1);
}

uint64_t TRIPBGetMessageInt64Field(uint64_t a1, void *a2)
{
  if (TRIPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16))) {
    return *(void *)(*(void *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
  }
  return [a2 defaultValue];
}

void *TRIPBSetMessageInt64Field(void *result, uint64_t a2, uint64_t a3)
{
  if (result && a2)
  {
    uint64_t v5 = result;
    int v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(result, "descriptor"), "file"), "syntax");
    return TRIPBSetInt64IvarWithFieldInternal(v5, a2, a3, v6);
  }
  return result;
}

void *TRIPBSetMessageUInt64Field(void *result, uint64_t a2, uint64_t a3)
{
  if (result && a2)
  {
    uint64_t v5 = result;
    int v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(result, "descriptor"), "file"), "syntax");
    return TRIPBSetUInt64IvarWithFieldInternal(v5, a2, a3, v6);
  }
  return result;
}

void *TRIPBSetUInt64IvarWithFieldInternal(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  unsigned int v8 = *(void **)(a2 + 16);
  if (v8) {
    TRIPBMaybeClearOneof((uint64_t)a1, v8, *(unsigned int *)(*(void *)(a2 + 8) + 20), *(_DWORD *)(*(void *)(a2 + 8) + 16));
  }
  *(void *)(a1[8] + *(unsigned int *)(*(void *)(a2 + 8) + 24)) = a3;
  BOOL v9 = 1;
  if (!a3 && a4 != 2) {
    BOOL v9 = *(void *)(a2 + 16) != 0;
  }
  TRIPBSetHasIvar((uint64_t)a1, *(_DWORD *)(*(void *)(a2 + 8) + 20), *(_DWORD *)(*(void *)(a2 + 8) + 16), v9);
  return TRIPBBecomeVisibleToAutocreator(a1);
}

float TRIPBGetMessageFloatField(uint64_t a1, void *a2)
{
  if (TRIPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16))) {
    return *(float *)(*(void *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
  }
  LODWORD(result) = [a2 defaultValue];
  return result;
}

void *TRIPBSetMessageFloatField(void *result, uint64_t a2, float a3)
{
  if (result && a2)
  {
    uint64_t v5 = result;
    int v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(result, "descriptor"), "file"), "syntax");
    return TRIPBSetFloatIvarWithFieldInternal(v5, a2, v6, a3);
  }
  return result;
}

void *TRIPBSetFloatIvarWithFieldInternal(void *a1, uint64_t a2, int a3, float a4)
{
  unsigned int v8 = *(void **)(a2 + 16);
  if (v8) {
    TRIPBMaybeClearOneof((uint64_t)a1, v8, *(unsigned int *)(*(void *)(a2 + 8) + 20), *(_DWORD *)(*(void *)(a2 + 8) + 16));
  }
  *(float *)(a1[8] + *(unsigned int *)(*(void *)(a2 + 8) + 24)) = a4;
  int v10 = a4 != 0.0 || a3 == 2 || *(void *)(a2 + 16) != 0;
  TRIPBSetHasIvar((uint64_t)a1, *(_DWORD *)(*(void *)(a2 + 8) + 20), *(_DWORD *)(*(void *)(a2 + 8) + 16), v10);
  return TRIPBBecomeVisibleToAutocreator(a1);
}

double TRIPBGetMessageDoubleField(uint64_t a1, void *a2)
{
  if (TRIPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16))) {
    return *(double *)(*(void *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
  }
  else {
    return COERCE_DOUBLE([a2 defaultValue]);
  }
}

void *TRIPBSetMessageDoubleField(void *result, uint64_t a2, double a3)
{
  if (result && a2)
  {
    uint64_t v5 = result;
    int v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(result, "descriptor"), "file"), "syntax");
    return TRIPBSetDoubleIvarWithFieldInternal(v5, a2, v6, a3);
  }
  return result;
}

void *TRIPBSetObjectIvarWithField(void *result, uint64_t a2, void *a3)
{
  if (result && a2)
  {
    uint64_t v5 = result;
    int v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(result, "descriptor"), "file"), "syntax");
    id v7 = a3;
    return TRIPBSetRetainedObjectIvarWithFieldInternal(v5, a2, v7, v6);
  }
  return result;
}

__CFString *TRIPBTextFormatForMessage(void *a1, __CFString *a2)
{
  uint64_t v2 = &stru_1EE43FA58;
  if (a1)
  {
    if (a2) {
      uint64_t v4 = a2;
    }
    else {
      uint64_t v4 = &stru_1EE43FA58;
    }
    uint64_t v2 = (__CFString *)[MEMORY[0x1E4F28E78] string];
    AppendTextFormatForMessage(a1, v2, v4);
  }
  return v2;
}

uint64_t AppendTextFormatForMessage(void *a1, void *a2, __CFString *a3)
{
  uint64_t v5 = a1;
  int v6 = (void *)[a1 descriptor];
  id v7 = (void *)v6[1];
  unint64_t v8 = [v7 count];
  uint64_t v9 = [v6 extensionRanges];
  unsigned int v10 = [v6 extensionRangesCount];
  uint64_t v11 = objc_msgSend((id)objc_msgSend(v5, "extensionsCurrentlySet"), "sortedArrayUsingSelector:", sel_compareByFieldNumber_);
  if (v8) {
    BOOL v12 = 0;
  }
  else {
    BOOL v12 = v10 == 0;
  }
  if (!v12)
  {
    uint64_t v13 = (void *)v11;
    unint64_t v14 = 0;
    unint64_t v15 = v10;
    unint64_t v16 = 0;
    v61 = v79;
    v62 = v75;
    v71 = v5;
    v64 = (void *)v11;
    uint64_t v65 = v9;
    v68 = a3;
    unint64_t v69 = v15;
    unint64_t v66 = v8;
    v67 = v7;
    while (1)
    {
      if (v14 == v8)
      {
        uint64_t v17 = v16++;
        AppendTextFormatForMessageExtensionRange(v5, v13, *(void *)(v9 + 8 * v17), a2, a3);
        unint64_t v14 = v8;
        goto LABEL_94;
      }
      if (v16 != v15)
      {
        uint64_t v18 = [v7 objectAtIndexedSubscript:v14];
        uint64_t v19 = (unint64_t *)(v9 + 8 * v16);
        if (*(_DWORD *)(*(void *)(v18 + 8) + 16) >= *(_DWORD *)v19)
        {
          ++v16;
          AppendTextFormatForMessageExtensionRange(v5, v13, *v19, a2, a3);
          goto LABEL_94;
        }
      }
      unint64_t v72 = v14 + 1;
      v73 = (void *)[v7 objectAtIndexedSubscript:v14];
      int v20 = [v73 fieldType];
      int v21 = v20;
      if (v20 == 2) {
        break;
      }
      if (v20 == 1)
      {
        uint64_t v25 = v5[8];
        uint64_t v26 = v73;
        unint64_t v70 = v16;
        if (v25)
        {
LABEL_19:
          BOOL v23 = *(void **)(v25 + *(unsigned int *)(v26[1] + 24));
          goto LABEL_22;
        }
LABEL_21:
        BOOL v23 = 0;
LABEL_22:
        unint64_t v24 = [v23 count];
        if (v24) {
          goto LABEL_23;
        }
        goto LABEL_14;
      }
      if (v20)
      {
        unint64_t v14 = v72;
        goto LABEL_94;
      }
      unint64_t v70 = v16;
      BOOL HasIvar = TRIPBGetHasIvar((uint64_t)v5, *(_DWORD *)(v73[1] + 20), *(_DWORD *)(v73[1] + 16));
      BOOL v23 = 0;
      unint64_t v24 = HasIvar;
      if (HasIvar)
      {
LABEL_23:
        uint64_t v27 = (void *)[v73 textFormatName];
        if ([v27 length]) {
          goto LABEL_26;
        }
        uint64_t v27 = objc_msgSend(NSString, "stringWithFormat:", @"%u", *(unsigned int *)(v73[1] + 16));
        if (v24 < 2)
        {
          uint64_t v55 = NSString;
          uint64_t v59 = [v73 name];
          v56 = v55;
          a3 = v68;
          uint64_t v5 = v71;
          unint64_t v28 = (__CFString *)[v56 stringWithFormat:@"  # %@", v59];
        }
        else
        {
          [a2 appendFormat:@"%@# %@\n", a3, objc_msgSend(v73, "name")];
LABEL_26:
          unint64_t v28 = &stru_1EE43FA58;
        }
        if (v21 == 2)
        {
          int v29 = [v73 mapKeyDataType];
          a3 = v68;
          int v30 = *(unsigned __int8 *)(v73[1] + 30);
          uint64_t v63 = [NSString stringWithFormat:@"%@%@ {%@\n", v68, v27, v28, v61, v62];
          uint64_t v31 = [NSString stringWithFormat:@"%@%@ {\n", v68, v27];
          uint64_t v32 = [NSString stringWithFormat:@"%@}\n", v68];
          uint64_t v33 = [NSString stringWithFormat:@"%@  key: ", v68];
          long long v34 = ":";
          if ((v30 - 15) < 2) {
            long long v34 = "";
          }
          uint64_t v35 = [NSString stringWithFormat:@"%@  value%s ", v68, v34];
          v81[0] = 0;
          v81[1] = v81;
          v81[2] = 0x2020000000;
          char v82 = 1;
          if (v29 == 14 && (v30 - 13) <= 3)
          {
            v78[0] = MEMORY[0x1E4F143A8];
            v78[1] = 3221225472;
            v79[0] = __AppendTextFormatForMapMessageField_block_invoke;
            v79[1] = &unk_1E576BA58;
            v79[2] = a2;
            v79[3] = v63;
            v79[4] = v31;
            v79[5] = v33;
            char v80 = v30;
            v79[6] = v35;
            v79[7] = v68;
            v79[8] = v32;
            v79[9] = v81;
            [v23 enumerateKeysAndObjectsUsingBlock:v78];
          }
          else
          {
            v74[0] = MEMORY[0x1E4F143A8];
            v74[1] = 3221225472;
            v75[0] = __AppendTextFormatForMapMessageField_block_invoke_2;
            v75[1] = &unk_1E576BA80;
            v75[9] = v32;
            v75[10] = v81;
            v75[2] = a2;
            v75[3] = v63;
            char v76 = v29;
            v75[4] = v31;
            v75[5] = v33;
            char v77 = v30;
            v75[6] = v35;
            v75[7] = v68;
            v75[8] = v73;
            [v23 enumerateForTextFormat:v74];
          }
          _Block_object_dispose(v81, 8);
          uint64_t v5 = v71;
          unint64_t v14 = v72;
        }
        else
        {
          uint64_t v36 = 0;
          int v37 = *(unsigned __int8 *)(v73[1] + 30);
          if ((v37 - 15) >= 2) {
            uint64_t v38 = ":";
          }
          else {
            uint64_t v38 = "";
          }
          do
          {
            [a2 appendFormat:@"%@%@%s ", a3, v27, v38];
            switch(v37)
            {
              case 0:
                if (v23) {
                  int v44 = [v23 valueAtIndex:v36];
                }
                else {
                  int v44 = TRIPBGetMessageBoolField((uint64_t)v5, v73);
                }
                if (v44) {
                  long long v52 = @"true";
                }
                else {
                  long long v52 = @"false";
                }
                [a2 appendString:v52];
                break;
              case 1:
              case 11:
                if (v23) {
                  uint64_t v41 = [v23 valueAtIndex:v36];
                }
                else {
                  uint64_t v41 = TRIPBGetMessageUInt32Field((uint64_t)v5, v73);
                }
                objc_msgSend(a2, "appendFormat:", @"%u", v41, v60);
                break;
              case 2:
              case 7:
              case 9:
                if (v23) {
                  uint64_t v39 = [v23 valueAtIndex:v36];
                }
                else {
                  uint64_t v39 = TRIPBGetMessageInt32Field((uint64_t)v5, v73);
                }
                objc_msgSend(a2, "appendFormat:", @"%d", v39, v60);
                break;
              case 3:
                if (v23) {
                  [v23 valueAtIndex:v36];
                }
                else {
                  float v45 = TRIPBGetMessageFloatField((uint64_t)v5, v73);
                }
                objc_msgSend(a2, "appendFormat:", @"%.*g", 6, v45);
                break;
              case 4:
              case 12:
                if (v23) {
                  uint64_t v42 = [v23 valueAtIndex:v36];
                }
                else {
                  uint64_t v42 = TRIPBGetMessageUInt64Field((uint64_t)v5, v73);
                }
                objc_msgSend(a2, "appendFormat:", @"%llu", v42, v60);
                break;
              case 5:
              case 8:
              case 10:
                if (v23) {
                  uint64_t v40 = [v23 valueAtIndex:v36];
                }
                else {
                  uint64_t v40 = TRIPBGetMessageInt64Field((uint64_t)v5, v73);
                }
                objc_msgSend(a2, "appendFormat:", @"%lld", v40, v60);
                break;
              case 6:
                if (v23) {
                  [v23 valueAtIndex:v36];
                }
                else {
                  double v46 = TRIPBGetMessageDoubleField((uint64_t)v5, v73);
                }
                objc_msgSend(a2, "appendFormat:", @"%.*lg", 15, *(void *)&v46);
                break;
              case 13:
                if (v23) {
                  v47 = (void *)[v23 objectAtIndex:v36];
                }
                else {
                  v47 = (void *)TRIPBGetObjectIvarWithField((uint64_t)v5, v73);
                }
                AppendBufferAsString(v47, a2);
                break;
              case 14:
                if (v23) {
                  v48 = (void *)[v23 objectAtIndex:v36];
                }
                else {
                  v48 = (void *)TRIPBGetObjectIvarWithField((uint64_t)v5, v73);
                }
                AppendStringEscaped(v48, a2);
                break;
              case 15:
              case 16:
                if (v23) {
                  uint64_t v43 = [v23 objectAtIndex:v36];
                }
                else {
                  uint64_t v43 = TRIPBGetObjectIvarWithField((uint64_t)v5, v73);
                }
                uint64_t v51 = v43;
                [a2 appendFormat:@"{%@\n", v28];
                AppendTextFormatForMessage(v51, a2, [(__CFString *)a3 stringByAppendingString:@"  "]);
                [a2 appendFormat:@"%@}", a3];
                unint64_t v28 = &stru_1EE43FA58;
                uint64_t v5 = v71;
                break;
              case 17:
                if (v23)
                {
                  uint64_t v49 = [v23 rawValueAtIndex:v36];
                  long long v50 = v73;
                }
                else
                {
                  long long v50 = v73;
                  uint64_t v49 = TRIPBGetMessageInt32Field((uint64_t)v5, v73);
                }
                v53 = (void *)[v50 enumDescriptor];
                if (v53 && (uint64_t v54 = [v53 textFormatNameForValue:v49]) != 0) {
                  [a2 appendString:v54];
                }
                else {
                  objc_msgSend(a2, "appendFormat:", @"%d", v49);
                }
                uint64_t v5 = v71;
                a3 = v68;
                break;
              default:
                break;
            }
            [a2 appendFormat:@"%@\n", v28];
            ++v36;
          }
          while (v24 != v36);
          unint64_t v14 = v72;
        }
        unint64_t v8 = v66;
        id v7 = v67;
        uint64_t v13 = v64;
        uint64_t v9 = v65;
        goto LABEL_93;
      }
LABEL_14:
      unint64_t v14 = v72;
LABEL_93:
      unint64_t v15 = v69;
      unint64_t v16 = v70;
LABEL_94:
      if (v14 >= v8 && v16 >= v15) {
        goto LABEL_98;
      }
    }
    uint64_t v25 = v5[8];
    unint64_t v70 = v16;
    if (v25)
    {
      uint64_t v26 = v73;
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_98:
  v57 = TRIPBTextFormatForUnknownFieldSet((void *)[v5 unknownFields], a3);
  uint64_t result = [(__CFString *)v57 length];
  if (result)
  {
    [a2 appendFormat:@"%@# --- Unknown fields ---\n", a3];
    return [a2 appendString:v57];
  }
  return result;
}

void sub_1935DA62C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

__CFString *TRIPBTextFormatForUnknownFieldSet(void *a1, __CFString *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = &stru_1EE43FA58;
  if (a1)
  {
    uint64_t v4 = a2 ? a2 : &stru_1EE43FA58;
    uint64_t v2 = (__CFString *)[MEMORY[0x1E4F28E78] string];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    obuint64_t j = (id)[a1 sortedFields];
    uint64_t v26 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v26)
    {
      uint64_t v25 = *(void *)v44;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v44 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = v5;
          int v6 = *(void **)(*((void *)&v43 + 1) + 8 * v5);
          uint64_t v7 = [v6 number];
          unint64_t v8 = (void *)[v6 varintList];
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          void v41[2] = __TRIPBTextFormatForUnknownFieldSet_block_invoke;
          v41[3] = &unk_1E576BA08;
          v41[4] = v2;
          v41[5] = v4;
          int v42 = v7;
          [v8 enumerateValuesWithBlock:v41];
          uint64_t v9 = (void *)[v6 fixed32List];
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          void v39[2] = __TRIPBTextFormatForUnknownFieldSet_block_invoke_2;
          v39[3] = &unk_1E576BA30;
          v39[4] = v2;
          v39[5] = v4;
          int v40 = v7;
          [v9 enumerateValuesWithBlock:v39];
          unsigned int v10 = (void *)[v6 fixed64List];
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          void v37[2] = __TRIPBTextFormatForUnknownFieldSet_block_invoke_3;
          v37[3] = &unk_1E576BA08;
          v37[4] = v2;
          v37[5] = v4;
          int v38 = v7;
          [v10 enumerateValuesWithBlock:v37];
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          uint64_t v27 = v6;
          uint64_t v11 = (void *)[v6 lengthDelimitedList];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v48 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v34;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v34 != v14) {
                  objc_enumerationMutation(v11);
                }
                unint64_t v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                [(__CFString *)v2 appendFormat:@"%@%d: ", v4, v7];
                AppendBufferAsString(v16, v2);
                [(__CFString *)v2 appendString:@"\n"];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v48 count:16];
            }
            while (v13);
          }
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          uint64_t v17 = (void *)[v27 groupList];
          uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v47 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v30;
            do
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v30 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void *)(*((void *)&v29 + 1) + 8 * j);
                [(__CFString *)v2 appendFormat:@"%@%d: {\n", v4, v7];
                [(__CFString *)v2 appendString:TRIPBTextFormatForUnknownFieldSet(v22, [(__CFString *)v4 stringByAppendingString:@"  "])];
                [(__CFString *)v2 appendFormat:@"%@}\n", v4];
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v47 count:16];
            }
            while (v19);
          }
          uint64_t v5 = v28 + 1;
        }
        while (v28 + 1 != v26);
        uint64_t v26 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v26);
    }
  }
  return v2;
}

uint64_t __TRIPBTextFormatForUnknownFieldSet_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@%d: %llu\n", *(void *)(a1 + 40), *(unsigned int *)(a1 + 48), a2];
}

uint64_t __TRIPBTextFormatForUnknownFieldSet_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@%d: 0x%X\n", *(void *)(a1 + 40), *(unsigned int *)(a1 + 48), a2];
}

uint64_t __TRIPBTextFormatForUnknownFieldSet_block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@%d: 0x%llX\n", *(void *)(a1 + 40), *(unsigned int *)(a1 + 48), a2];
}

uint64_t AppendBufferAsString(void *a1, void *a2)
{
  uint64_t v4 = (char *)[a1 bytes];
  uint64_t v5 = [a1 length];
  [a2 appendString:@"\""];
  if (v5 >= 1)
  {
    int v6 = &v4[v5];
    do
    {
      uint64_t v7 = *v4;
      if ((int)v7 > 33)
      {
        switch(v7)
        {
          case '""':
            unint64_t v8 = a2;
            uint64_t v9 = @"\\\"";
            goto LABEL_16;
          case '\'':
            unint64_t v8 = a2;
            uint64_t v9 = @"\\'";
            goto LABEL_16;
          case '\\':
            unint64_t v8 = a2;
            uint64_t v9 = @"\\\\"";
            goto LABEL_16;
        }
      }
      else
      {
        switch(v7)
        {
          case 9:
            unint64_t v8 = a2;
            uint64_t v9 = @"\\t";
            goto LABEL_16;
          case 0xA:
            unint64_t v8 = a2;
            uint64_t v9 = @"\\n";
            goto LABEL_16;
          case 0xD:
            unint64_t v8 = a2;
            uint64_t v9 = @"\\r";
LABEL_16:
            [v8 appendString:v9];
            goto LABEL_17;
        }
      }
      if ((v7 & 0x80000000) != 0)
      {
        if (!__maskrune(*v4, 0x40000uLL))
        {
LABEL_23:
          objc_msgSend(a2, "appendFormat:", @"\\%03o", v7);
          goto LABEL_17;
        }
      }
      else if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v7 + 60) & 0x40000) == 0)
      {
        goto LABEL_23;
      }
      objc_msgSend(a2, "appendFormat:", @"%c", v7);
LABEL_17:
      ++v4;
    }
    while (v4 < v6);
  }
  return [a2 appendString:@"\""];
}

BOOL TRIPBClassHasSel(objc_class *a1, const char *a2)
{
  unsigned int outCount = 0;
  uint64_t v3 = class_copyMethodList(a1, &outCount);
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      SEL Name = method_getName(v3[i]);
      BOOL v6 = Name == a2;
      if (Name == a2) {
        break;
      }
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  free(v3);
  return v6;
}

uint64_t AppendTextFormatForMessageExtensionRange(void *a1, void *a2, unint64_t a3, void *a4, void *a5)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (result)
  {
    uint64_t v9 = result;
    unint64_t v31 = HIDWORD(a3);
    uint64_t v10 = *(void *)v37;
    uint64_t v28 = *(void *)v37;
    int v29 = a3;
    do
    {
      uint64_t v11 = 0;
      uint64_t v32 = v9;
      do
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(a2);
        }
        uint64_t v12 = *(void **)(*((void *)&v36 + 1) + 8 * v11);
        uint64_t result = [v12 fieldNumber];
        if (result >= a3)
        {
          uint64_t v13 = result;
          if (result > v31) {
            return result;
          }
          uint64_t v14 = (void *)[a1 getExtension:v12];
          int v15 = [v12 isRepeated];
          uint64_t v34 = v11;
          if (v15)
          {
            uint64_t v16 = [v14 count];
            uint64_t v17 = [v12 singletonName];
            if (v16 != 1)
            {
              [a4 appendFormat:@"%@# [%@]\n", a5, v17];
              int v18 = [v12 dataType];
              if (v16)
              {
                int v19 = v18;
                long long v35 = &stru_1EE43FA58;
                goto LABEL_14;
              }
              long long v35 = &stru_1EE43FA58;
LABEL_38:
              [a4 appendFormat:@"%@\n", v35];
              uint64_t v10 = v28;
              LODWORD(a3) = v29;
              uint64_t v9 = v32;
              uint64_t v11 = v34;
              goto LABEL_39;
            }
          }
          else
          {
            uint64_t v17 = [v12 singletonName];
          }
          long long v35 = (__CFString *)[NSString stringWithFormat:@"  # [%@]", v17];
          int v19 = [v12 dataType];
          uint64_t v16 = 1;
LABEL_14:
          uint64_t v20 = 0;
          if ((v19 - 15) >= 2) {
            int v21 = ":";
          }
          else {
            int v21 = "";
          }
          do
          {
            uint64_t v22 = v14;
            if (v15) {
              uint64_t v22 = (void *)[v14 objectAtIndex:v20];
            }
            [a4 appendFormat:@"%@%u%s ", a5, v13, v21];
            switch(v19)
            {
              case 0:
                if ([v22 BOOLValue]) {
                  uint64_t v25 = @"true";
                }
                else {
                  uint64_t v25 = @"false";
                }
                [a4 appendString:v25];
                break;
              case 1:
              case 11:
                objc_msgSend(a4, "appendFormat:", @"%u", objc_msgSend(v22, "unsignedIntValue"), v27);
                break;
              case 2:
                uint64_t v23 = [v22 unsignedIntValue];
                goto LABEL_32;
              case 3:
                [v22 floatValue];
                objc_msgSend(a4, "appendFormat:", @"%.*g", 6, v24);
                break;
              case 4:
              case 12:
                objc_msgSend(a4, "appendFormat:", @"%llu", objc_msgSend(v22, "unsignedLongLongValue"), v27);
                break;
              case 5:
              case 8:
              case 10:
                objc_msgSend(a4, "appendFormat:", @"%lld", objc_msgSend(v22, "longLongValue"), v27);
                break;
              case 6:
                [v22 doubleValue];
                objc_msgSend(a4, "appendFormat:", @"%.*lg", 15, v26);
                break;
              case 7:
              case 9:
              case 17:
                uint64_t v23 = [v22 intValue];
LABEL_32:
                objc_msgSend(a4, "appendFormat:", @"%d", v23, v27);
                break;
              case 13:
                AppendBufferAsString(v22, a4);
                break;
              case 14:
                AppendStringEscaped(v22, a4);
                break;
              case 15:
              case 16:
                [a4 appendFormat:@"{%@\n", v35];
                AppendTextFormatForMessage(v22, a4, [a5 stringByAppendingString:@"  "]);
                [a4 appendFormat:@"%@}", a5];
                long long v35 = &stru_1EE43FA58;
                break;
              default:
                break;
            }
            ++v20;
          }
          while (v16 != v20);
          goto LABEL_38;
        }
LABEL_39:
        ++v11;
      }
      while (v11 != v9);
      uint64_t result = [a2 countByEnumeratingWithState:&v36 objects:v40 count:16];
      uint64_t v9 = result;
    }
    while (result);
  }
  return result;
}

uint64_t AppendStringEscaped(void *a1, void *a2)
{
  [a2 appendString:@"\""];
  uint64_t v4 = [a1 length];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; v5 != i; ++i)
    {
      uint64_t v7 = [a1 characterAtIndex:i];
      if ((int)v7 > 33)
      {
        switch(v7)
        {
          case '""':
            unint64_t v8 = a2;
            uint64_t v9 = @"\\\"";
            break;
          case '\'':
            unint64_t v8 = a2;
            uint64_t v9 = @"\\'";
            break;
          case '\\':
            unint64_t v8 = a2;
            uint64_t v9 = @"\\\\"";
            break;
          default:
LABEL_19:
            if (v7 > 0x1F) {
              objc_msgSend(a2, "appendFormat:", @"%C", v7, v11, v12);
            }
            else {
              objc_msgSend(a2, "appendFormat:", @"\\%d%d%d", 0, v7 >> 3, v7 & 7);
            }
            continue;
        }
      }
      else
      {
        switch(v7)
        {
          case 9:
            unint64_t v8 = a2;
            uint64_t v9 = @"\\t";
            break;
          case 0xA:
            unint64_t v8 = a2;
            uint64_t v9 = @"\\n";
            break;
          case 0xD:
            unint64_t v8 = a2;
            uint64_t v9 = @"\\r";
            break;
          default:
            goto LABEL_19;
        }
      }
      [v8 appendString:v9];
    }
  }
  return [a2 appendString:@"\""];
}

uint64_t __AppendTextFormatForMapMessageField_block_invoke(uint64_t a1, void *a2, void *a3)
{
  BOOL v6 = *(void **)(a1 + 32);
  uint64_t v7 = 40;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
    uint64_t v7 = 48;
  }
  [v6 appendString:*(void *)(a1 + v7)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
  [*(id *)(a1 + 32) appendString:*(void *)(a1 + 56)];
  AppendStringEscaped(a2, *(void **)(a1 + 32));
  [*(id *)(a1 + 32) appendString:@"\n"];
  [*(id *)(a1 + 32) appendString:*(void *)(a1 + 64)];
  int v8 = *(unsigned __int8 *)(a1 + 96);
  switch(v8)
  {
    case 13:
      AppendBufferAsString(a3, *(void **)(a1 + 32));
      break;
    case 15:
      [*(id *)(a1 + 32) appendString:@"{\n"];
      AppendTextFormatForMessage(a3, *(void *)(a1 + 32), [*(id *)(a1 + 72) stringByAppendingString:@"    "]);
      [*(id *)(a1 + 32) appendFormat:@"%@  }", *(void *)(a1 + 72)];
      break;
    case 14:
      AppendStringEscaped(a3, *(void **)(a1 + 32));
      break;
    default:
      uint64_t v9 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void AppendTextFormatForMapMessageField(id, TRIPBFieldDescriptor *, NSMutableString *, NSString *, NSString *, NSString *)_block_invoke"), @"TRIPBUtilities.m", 1608, @"Can't happen");
      break;
  }
  [*(id *)(a1 + 32) appendString:@"\n"];
  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 80);
  return [v10 appendString:v11];
}

uint64_t __AppendTextFormatForMapMessageField_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  BOOL v6 = *(void **)(a1 + 32);
  uint64_t v7 = 40;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)) {
    uint64_t v7 = 48;
  }
  [v6 appendString:*(void *)(a1 + v7)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 0;
  int v8 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 104) == 14)
  {
    [v8 appendString:*(void *)(a1 + 56)];
    AppendStringEscaped(a2, *(void **)(a1 + 32));
    [*(id *)(a1 + 32) appendString:@"\n"];
  }
  else
  {
    [v8 appendFormat:@"%@%@\n", *(void *)(a1 + 56), a2];
  }
  [*(id *)(a1 + 32) appendString:*(void *)(a1 + 64)];
  switch(*(unsigned char *)(a1 + 105))
  {
    case 0xD:
      AppendBufferAsString(a3, *(void **)(a1 + 32));
      goto LABEL_18;
    case 0xE:
      AppendStringEscaped(a3, *(void **)(a1 + 32));
      goto LABEL_18;
    case 0xF:
      [*(id *)(a1 + 32) appendString:@"{\n"];
      AppendTextFormatForMessage(a3, *(void *)(a1 + 32), [*(id *)(a1 + 72) stringByAppendingString:@"    "]);
      [*(id *)(a1 + 32) appendFormat:@"%@  }", *(void *)(a1 + 72)];
      goto LABEL_18;
    case 0x10:
      uint64_t v14 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void AppendTextFormatForMapMessageField(id, TRIPBFieldDescriptor *, NSMutableString *, NSString *, NSString *, NSString *)_block_invoke_2"), @"TRIPBUtilities.m", 1667, @"Can't happen");
      goto LABEL_16;
    case 0x11:
      uint64_t v9 = [a3 intValue];
      uint64_t v10 = (void *)[*(id *)(a1 + 80) enumDescriptor];
      if (v10 && (uint64_t v11 = [v10 textFormatNameForValue:v9]) != 0)
      {
        uint64_t v12 = (void *)v11;
        uint64_t v13 = *(void **)(a1 + 32);
LABEL_17:
        [v13 appendString:v12];
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"%d", v9);
      }
LABEL_18:
      [*(id *)(a1 + 32) appendString:@"\n"];
      int v15 = *(void **)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 88);
      return [v15 appendString:v16];
    default:
LABEL_16:
      uint64_t v13 = *(void **)(a1 + 32);
      uint64_t v12 = a3;
      goto LABEL_17;
  }
}

void *TRIPBCreateMessageWithAutocreator(objc_class *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = objc_alloc_init(a1);
  v5[4] = a2;
  v5[5] = a3;
  return v5;
}

BOOL TRIPBWasMessageAutocreatedBy(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

void *TRIPBAutocreatedArrayModified(void *a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = *(void **)([(id)objc_opt_class() descriptor] + 8);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v9 fieldType] == 1)
        {
          uint64_t v10 = a1[8];
          if (v10) {
            uint64_t v10 = *(void *)(v10 + *(unsigned int *)(v9[1] + 24));
          }
          if (v10 == a2)
          {
            if (*(unsigned __int8 *)(v9[1] + 30) - 13 >= 4) {
              uint64_t v13 = &OBJC_IVAR___TRIPBInt32Array__autocreator;
            }
            else {
              uint64_t v13 = &OBJC_IVAR___TRIPBAutocreatedArray__autocreator;
            }
            *(void *)(a2 + *v13) = 0;
            return TRIPBBecomeVisibleToAutocreator(a1);
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  return (void *)[v11 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "void TRIPBAutocreatedArrayModified(TRIPBMessage *, id)"), @"TRIPBMessage.m", 699, @"Unknown autocreated %@ for %@.", objc_opt_class(), a1 file lineNumber description];
}

void *TRIPBAutocreatedDictionaryModified(void *a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = *(void **)([(id)objc_opt_class() descriptor] + 8);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v9 fieldType] == 2)
        {
          uint64_t v10 = a1[8];
          if (v10) {
            uint64_t v10 = *(void *)(v10 + *(unsigned int *)(v9[1] + 24));
          }
          if (v10 == a2)
          {
            if ([v9 mapKeyDataType] == 14
              && *(unsigned __int8 *)(v9[1] + 30) - 13 < 4)
            {
              uint64_t v13 = &OBJC_IVAR___TRIPBAutocreatedDictionary__autocreator;
            }
            else
            {
              uint64_t v13 = &OBJC_IVAR___TRIPBInt32Int32Dictionary__autocreator;
            }
            *(void *)(a2 + *v13) = 0;
            return TRIPBBecomeVisibleToAutocreator(a1);
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  return (void *)[v11 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "void TRIPBAutocreatedDictionaryModified(TRIPBMessage *, id)"), @"TRIPBMessage.m", 722, @"Unknown autocreated %@ for %@.", objc_opt_class(), a1 file lineNumber description];
}

void TRIPBPrepareReadOnlySemaphore(uint64_t a1)
{
  uint64_t v1 = (atomic_ullong *)(a1 + 56);
  if (!atomic_load((unint64_t *)(a1 + 56)))
  {
    uint64_t v3 = dispatch_semaphore_create(1);
    uint64_t v4 = 0;
    atomic_compare_exchange_strong(v1, (unint64_t *)&v4, (unint64_t)v3);
    if (v4)
    {
      dispatch_release(v3);
    }
  }
}

void sub_1935DBC3C()
{
}

uint64_t CheckExtension(uint64_t a1, void *a2)
{
  [a2 containingMessageClass];
  uint64_t result = objc_opt_isKindOfClass();
  if ((result & 1) == 0) {
    return [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Extension %@ used on wrong class (%@ instead of %@)", objc_msgSend(a2, "singletonName"), objc_opt_class(), objc_msgSend(a2, "containingMessageClass") format];
  }
  return result;
}

void sub_1935DD978()
{
}

uint64_t GetOrMakeUnknownFields(void *a1)
{
  uint64_t result = a1[1];
  if (!result)
  {
    a1[1] = objc_alloc_init(TRIPBUnknownFieldSet);
    TRIPBBecomeVisibleToAutocreator(a1);
    return a1[1];
  }
  return result;
}

uint64_t MergeRepeatedPackedFieldFromCodedInputStream(void *a1, void *a2, int a3, void *a4)
{
  int v7 = *(unsigned __int8 *)(a2[1] + 30);
  int v8 = a4 + 1;
  ArrayIvarWithField = GetOrCreateArrayIvarWithField(a1, a2, a3);
  uint64_t result = ReadRawVarint64(v8);
  uint64_t v11 = a4[3];
  unint64_t v12 = a4[4];
  unint64_t v13 = v11 + (int)result;
  if (v13 > v12)
  {
    uint64_t result = RaiseException(-102, 0);
    uint64_t v11 = a4[3];
  }
  a4[4] = v13;
  if (v13 != v11)
  {
    do
    {
      switch(v7)
      {
        case 0:
          uint64_t RawVarint64 = ReadRawVarint64(v8) != 0;
          goto LABEL_15;
        case 1:
        case 2:
          CheckSize((uint64_t)v8, 4);
          uint64_t v15 = a4[3];
          uint64_t RawVarint64 = *(unsigned int *)(a4[1] + v15);
          a4[3] = v15 + 4;
          goto LABEL_15;
        case 3:
          CheckSize((uint64_t)v8, 4);
          uint64_t v20 = a4[3];
          LODWORD(v21) = *(_DWORD *)(a4[1] + v20);
          a4[3] = v20 + 4;
          uint64_t result = [(TRIPBAutocreatedArray *)ArrayIvarWithField addValue:v21];
          break;
        case 4:
        case 5:
          CheckSize((uint64_t)v8, 8);
          uint64_t v17 = a4[3];
          uint64_t v18 = *(void *)(a4[1] + v17);
          a4[3] = v17 + 8;
          goto LABEL_18;
        case 6:
          CheckSize((uint64_t)v8, 8);
          uint64_t v22 = a4[3];
          double v23 = *(double *)(a4[1] + v22);
          a4[3] = v22 + 8;
          uint64_t result = [(TRIPBAutocreatedArray *)ArrayIvarWithField addValue:v23];
          break;
        case 7:
        case 11:
          uint64_t RawVarint64 = ReadRawVarint64(v8);
          uint64_t v19 = ArrayIvarWithField;
          goto LABEL_16;
        case 8:
        case 12:
          uint64_t v18 = ReadRawVarint64(v8);
          goto LABEL_18;
        case 9:
          unsigned int v24 = ReadRawVarint64(v8);
          uint64_t RawVarint64 = -(v24 & 1) ^ (v24 >> 1);
LABEL_15:
          uint64_t v19 = ArrayIvarWithField;
LABEL_16:
          uint64_t result = [(TRIPBAutocreatedArray *)v19 addValue:RawVarint64];
          break;
        case 10:
          unint64_t v25 = ReadRawVarint64(v8);
          uint64_t v18 = -(uint64_t)(v25 & 1) ^ (v25 >> 1);
LABEL_18:
          uint64_t result = [(TRIPBAutocreatedArray *)ArrayIvarWithField addValue:v18];
          break;
        case 13:
        case 14:
        case 15:
        case 16:
          long long v14 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          uint64_t result = objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void MergeRepeatedPackedFieldFromCodedInputStream(TRIPBMessage *, TRIPBFieldDescriptor *, TRIPBFileSyntax, TRIPBCodedInputStream *)"), @"TRIPBMessage.m", 2234, @"Non primitive types can't be packed");
          break;
        case 17:
          uint64_t v26 = ReadRawVarint64(v8);
          if (a3 == 3 || [a2 isValidEnumValue:v26]) {
            uint64_t result = [(TRIPBAutocreatedArray *)ArrayIvarWithField addRawValue:v26];
          }
          else {
            uint64_t result = [(id)GetOrMakeUnknownFields(a1) mergeVarintField:*(unsigned int *)(a2[1] + 16) value:v26];
          }
          break;
        default:
          break;
      }
    }
    while (a4[4] != a4[3]);
  }
  a4[4] = v12;
  return result;
}

TRIPBAutocreatedDictionary *GetOrCreateMapIvarWithField(void *a1, void *a2, int a3)
{
  uint64_t v6 = a1[8];
  if (!v6 || (MapForField = *(TRIPBAutocreatedDictionary **)(v6 + *(unsigned int *)(a2[1] + 24))) == 0)
  {
    MapForField = CreateMapForField(a2, 0);
    TRIPBSetRetainedObjectIvarWithFieldInternal(a1, (uint64_t)a2, MapForField, a3);
  }
  return MapForField;
}

void sub_1935DFD7C(_Unwind_Exception *a1)
{
}

TRIPBAutocreatedArray *TRIPBGetMessageRepeatedField(void *a1, void *a2)
{
  int v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "descriptor"), "file"), "syntax");
  return GetOrCreateArrayIvarWithField(a1, a2, v4);
}

TRIPBAutocreatedDictionary *TRIPBGetMessageMapField(void *a1, void *a2)
{
  int v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "descriptor"), "file"), "syntax");
  return GetOrCreateMapIvarWithField(a1, a2, v4);
}

TRIPBAutocreatedDictionary *CreateMapForField(void *a1, TRIPBMessage *a2)
{
  int v4 = [a1 mapKeyDataType];
  int v5 = *(unsigned __int8 *)(a1[1] + 30);
  switch(v4)
  {
    case 0:
      switch(*(unsigned char *)(a1[1] + 30))
      {
        case 0:
          uint64_t v11 = TRIPBBoolBoolDictionary;
          goto LABEL_74;
        case 1:
        case 0xB:
          uint64_t v11 = TRIPBBoolUInt32Dictionary;
          goto LABEL_74;
        case 2:
        case 7:
        case 9:
          uint64_t v11 = TRIPBBoolInt32Dictionary;
          goto LABEL_74;
        case 3:
          uint64_t v11 = TRIPBBoolFloatDictionary;
          goto LABEL_74;
        case 4:
        case 0xC:
          uint64_t v11 = TRIPBBoolUInt64Dictionary;
          goto LABEL_74;
        case 5:
        case 8:
        case 0xA:
          uint64_t v11 = TRIPBBoolInt64Dictionary;
          goto LABEL_74;
        case 6:
          uint64_t v11 = TRIPBBoolDoubleDictionary;
          goto LABEL_74;
        case 0xD:
        case 0xE:
        case 0xF:
          uint64_t v11 = TRIPBBoolObjectDictionary;
          goto LABEL_74;
        case 0x10:
          uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", "id CreateMapForField(TRIPBFieldDescriptor *, TRIPBMessage *)");
          int v8 = (void *)v18;
          uint64_t v9 = 307;
          goto LABEL_3;
        case 0x11:
          unint64_t v13 = TRIPBBoolEnumDictionary;
          goto LABEL_82;
        default:
          goto LABEL_16;
      }
    case 1:
    case 11:
      switch(*(unsigned char *)(a1[1] + 30))
      {
        case 0:
          uint64_t v11 = TRIPBUInt32BoolDictionary;
          goto LABEL_74;
        case 1:
        case 0xB:
          uint64_t v11 = TRIPBUInt32UInt32Dictionary;
          goto LABEL_74;
        case 2:
        case 7:
        case 9:
          uint64_t v11 = TRIPBUInt32Int32Dictionary;
          goto LABEL_74;
        case 3:
          uint64_t v11 = TRIPBUInt32FloatDictionary;
          goto LABEL_74;
        case 4:
        case 0xC:
          uint64_t v11 = TRIPBUInt32UInt64Dictionary;
          goto LABEL_74;
        case 5:
        case 8:
        case 0xA:
          uint64_t v11 = TRIPBUInt32Int64Dictionary;
          goto LABEL_74;
        case 6:
          uint64_t v11 = TRIPBUInt32DoubleDictionary;
          goto LABEL_74;
        case 0xD:
        case 0xE:
        case 0xF:
          uint64_t v11 = TRIPBUInt32ObjectDictionary;
          goto LABEL_74;
        case 0x10:
          uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", "id CreateMapForField(TRIPBFieldDescriptor *, TRIPBMessage *)");
          int v8 = (void *)v15;
          uint64_t v9 = 351;
          goto LABEL_3;
        case 0x11:
          unint64_t v13 = TRIPBUInt32EnumDictionary;
          goto LABEL_82;
        default:
          goto LABEL_16;
      }
    case 2:
    case 7:
    case 9:
      switch(*(unsigned char *)(a1[1] + 30))
      {
        case 0:
          uint64_t v11 = TRIPBInt32BoolDictionary;
          goto LABEL_74;
        case 1:
        case 0xB:
          uint64_t v11 = TRIPBInt32UInt32Dictionary;
          goto LABEL_74;
        case 2:
        case 7:
        case 9:
          uint64_t v11 = TRIPBInt32Int32Dictionary;
          goto LABEL_74;
        case 3:
          uint64_t v11 = TRIPBInt32FloatDictionary;
          goto LABEL_74;
        case 4:
        case 0xC:
          uint64_t v11 = TRIPBInt32UInt64Dictionary;
          goto LABEL_74;
        case 5:
        case 8:
        case 0xA:
          uint64_t v11 = TRIPBInt32Int64Dictionary;
          goto LABEL_74;
        case 6:
          uint64_t v11 = TRIPBInt32DoubleDictionary;
          goto LABEL_74;
        case 0xD:
        case 0xE:
        case 0xF:
          uint64_t v11 = TRIPBInt32ObjectDictionary;
          goto LABEL_74;
        case 0x10:
          uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", "id CreateMapForField(TRIPBFieldDescriptor *, TRIPBMessage *)");
          int v8 = (void *)v12;
          uint64_t v9 = 396;
          goto LABEL_3;
        case 0x11:
          unint64_t v13 = TRIPBInt32EnumDictionary;
          goto LABEL_82;
        default:
          goto LABEL_16;
      }
    case 3:
    case 6:
    case 13:
    case 15:
    case 16:
    case 17:
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", "id CreateMapForField(TRIPBFieldDescriptor *, TRIPBMessage *)");
      int v8 = (void *)v6;
      uint64_t v9 = 543;
LABEL_3:
      [v8 handleFailureInFunction:v7 file:@"TRIPBMessage.m" lineNumber:v9 description:@"shouldn't happen"];
      uint64_t result = 0;
      break;
    case 4:
    case 12:
      switch(*(unsigned char *)(a1[1] + 30))
      {
        case 0:
          uint64_t v11 = TRIPBUInt64BoolDictionary;
          goto LABEL_74;
        case 1:
        case 0xB:
          uint64_t v11 = TRIPBUInt64UInt32Dictionary;
          goto LABEL_74;
        case 2:
        case 7:
        case 9:
          uint64_t v11 = TRIPBUInt64Int32Dictionary;
          goto LABEL_74;
        case 3:
          uint64_t v11 = TRIPBUInt64FloatDictionary;
          goto LABEL_74;
        case 4:
        case 0xC:
          uint64_t v11 = TRIPBUInt64UInt64Dictionary;
          goto LABEL_74;
        case 5:
        case 8:
        case 0xA:
          uint64_t v11 = TRIPBUInt64Int64Dictionary;
          goto LABEL_74;
        case 6:
          uint64_t v11 = TRIPBUInt64DoubleDictionary;
          goto LABEL_74;
        case 0xD:
        case 0xE:
        case 0xF:
          uint64_t v11 = TRIPBUInt64ObjectDictionary;
          goto LABEL_74;
        case 0x10:
          uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", "id CreateMapForField(TRIPBFieldDescriptor *, TRIPBMessage *)");
          int v8 = (void *)v16;
          uint64_t v9 = 440;
          goto LABEL_3;
        case 0x11:
          unint64_t v13 = TRIPBUInt64EnumDictionary;
          goto LABEL_82;
        default:
          goto LABEL_16;
      }
    case 5:
    case 8:
    case 10:
      switch(*(unsigned char *)(a1[1] + 30))
      {
        case 0:
          uint64_t v11 = TRIPBInt64BoolDictionary;
          goto LABEL_74;
        case 1:
        case 0xB:
          uint64_t v11 = TRIPBInt64UInt32Dictionary;
          goto LABEL_74;
        case 2:
        case 7:
        case 9:
          uint64_t v11 = TRIPBInt64Int32Dictionary;
          goto LABEL_74;
        case 3:
          uint64_t v11 = TRIPBInt64FloatDictionary;
          goto LABEL_74;
        case 4:
        case 0xC:
          uint64_t v11 = TRIPBInt64UInt64Dictionary;
          goto LABEL_74;
        case 5:
        case 8:
        case 0xA:
          uint64_t v11 = TRIPBInt64Int64Dictionary;
          goto LABEL_74;
        case 6:
          uint64_t v11 = TRIPBInt64DoubleDictionary;
          goto LABEL_74;
        case 0xD:
        case 0xE:
        case 0xF:
          uint64_t v11 = TRIPBInt64ObjectDictionary;
          goto LABEL_74;
        case 0x10:
          uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", "id CreateMapForField(TRIPBFieldDescriptor *, TRIPBMessage *)");
          int v8 = (void *)v14;
          uint64_t v9 = 485;
          goto LABEL_3;
        case 0x11:
          unint64_t v13 = TRIPBInt64EnumDictionary;
          goto LABEL_82;
        default:
          goto LABEL_16;
      }
    case 14:
      switch(*(unsigned char *)(a1[1] + 30))
      {
        case 0:
          uint64_t v11 = TRIPBStringBoolDictionary;
          goto LABEL_74;
        case 1:
        case 0xB:
          uint64_t v11 = TRIPBStringUInt32Dictionary;
          goto LABEL_74;
        case 2:
        case 7:
        case 9:
          uint64_t v11 = TRIPBStringInt32Dictionary;
          goto LABEL_74;
        case 3:
          uint64_t v11 = TRIPBStringFloatDictionary;
          goto LABEL_74;
        case 4:
        case 0xC:
          uint64_t v11 = TRIPBStringUInt64Dictionary;
          goto LABEL_74;
        case 5:
        case 8:
        case 0xA:
          uint64_t v11 = TRIPBStringInt64Dictionary;
          goto LABEL_74;
        case 6:
          uint64_t v11 = TRIPBStringDoubleDictionary;
LABEL_74:
          uint64_t result = (TRIPBAutocreatedDictionary *)objc_alloc_init(v11);
          if (a2) {
            goto LABEL_75;
          }
          return result;
        case 0xD:
        case 0xE:
        case 0xF:
          if (a2)
          {
            uint64_t result = objc_alloc_init(TRIPBAutocreatedDictionary);
            goto LABEL_77;
          }
          uint64_t v17 = (objc_class *)MEMORY[0x1E4F1CA60];
          uint64_t result = (TRIPBAutocreatedDictionary *)objc_alloc_init(v17);
          break;
        case 0x10:
          uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", "id CreateMapForField(TRIPBFieldDescriptor *, TRIPBMessage *)");
          int v8 = (void *)v19;
          uint64_t v9 = 532;
          goto LABEL_3;
        case 0x11:
          unint64_t v13 = TRIPBStringEnumDictionary;
LABEL_82:
          uint64_t result = (TRIPBAutocreatedDictionary *)objc_msgSend([v13 alloc], "initWithValidationFunction:", objc_msgSend((id)objc_msgSend(a1, "enumDescriptor"), "enumVerifier"));
          if (a2) {
            goto LABEL_75;
          }
          return result;
        default:
          goto LABEL_16;
      }
      break;
    default:
LABEL_16:
      uint64_t result = 0;
      if (a2)
      {
LABEL_75:
        if (v4 == 14 && (v5 - 13) <= 3) {
LABEL_77:
        }
          result->_autocreator = a2;
        else {
          result->_autocreator = a2;
        }
      }
      break;
  }
  return result;
}

uint64_t __ResolveIvarGet_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return TRIPBGetMessageUInt32Field(a2, *(void **)(a1 + 32));
}

uint64_t __ResolveIvarGet_block_invoke_3(uint64_t a1, uint64_t a2)
{
  return TRIPBGetMessageInt32Field(a2, *(void **)(a1 + 32));
}

float __ResolveIvarGet_block_invoke_4(uint64_t a1, uint64_t a2)
{
  return TRIPBGetMessageFloatField(a2, *(void **)(a1 + 32));
}

uint64_t __ResolveIvarGet_block_invoke_5(uint64_t a1, uint64_t a2)
{
  return TRIPBGetMessageUInt64Field(a2, *(void **)(a1 + 32));
}

uint64_t __ResolveIvarGet_block_invoke_6(uint64_t a1, uint64_t a2)
{
  return TRIPBGetMessageInt64Field(a2, *(void **)(a1 + 32));
}

double __ResolveIvarGet_block_invoke_7(uint64_t a1, uint64_t a2)
{
  return TRIPBGetMessageDoubleField(a2, *(void **)(a1 + 32));
}

uint64_t __ResolveIvarGet_block_invoke_8(uint64_t a1, uint64_t a2)
{
  return TRIPBGetMessageInt32Field(a2, *(void **)(a1 + 32));
}

uint64_t __ResolveIvarGet_block_invoke_9(uint64_t a1, uint64_t a2)
{
  return TRIPBGetMessageInt64Field(a2, *(void **)(a1 + 32));
}

uint64_t __ResolveIvarGet_block_invoke_10(uint64_t a1, uint64_t a2)
{
  return TRIPBGetMessageInt32Field(a2, *(void **)(a1 + 32));
}

uint64_t __ResolveIvarGet_block_invoke_11(uint64_t a1, uint64_t a2)
{
  return TRIPBGetMessageInt64Field(a2, *(void **)(a1 + 32));
}

uint64_t __ResolveIvarGet_block_invoke_12(uint64_t a1, uint64_t a2)
{
  return TRIPBGetMessageUInt32Field(a2, *(void **)(a1 + 32));
}

uint64_t __ResolveIvarGet_block_invoke_14(uint64_t a1, uint64_t a2)
{
  return TRIPBGetObjectIvarWithField(a2, *(void **)(a1 + 32));
}

uint64_t __ResolveIvarGet_block_invoke_17(uint64_t a1, uint64_t a2)
{
  return TRIPBGetObjectIvarWithField(a2, *(void **)(a1 + 32));
}

void *__ResolveIvarSet_block_invoke(uint64_t a1, void *a2, int a3)
{
  return TRIPBSetBoolIvarWithFieldInternal(a2, *(void *)(a1 + 32), a3, *(unsigned __int8 *)(a1 + 40));
}

void *__ResolveIvarSet_block_invoke_2(uint64_t a1, void *a2, int a3)
{
  return TRIPBSetUInt32IvarWithFieldInternal(a2, *(void *)(a1 + 32), a3, *(unsigned __int8 *)(a1 + 40));
}

void *__ResolveIvarSet_block_invoke_3(uint64_t a1, void *a2, int a3)
{
  return TRIPBSetInt32IvarWithFieldInternal(a2, *(void *)(a1 + 32), a3, *(unsigned __int8 *)(a1 + 40));
}

void *__ResolveIvarSet_block_invoke_4(uint64_t a1, void *a2, float a3)
{
  return TRIPBSetFloatIvarWithFieldInternal(a2, *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), a3);
}

void *__ResolveIvarSet_block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  return TRIPBSetUInt64IvarWithFieldInternal(a2, *(void *)(a1 + 32), a3, *(unsigned __int8 *)(a1 + 40));
}

void *__ResolveIvarSet_block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  return TRIPBSetInt64IvarWithFieldInternal(a2, *(void *)(a1 + 32), a3, *(unsigned __int8 *)(a1 + 40));
}

void *__ResolveIvarSet_block_invoke_7(uint64_t a1, void *a2, double a3)
{
  return TRIPBSetDoubleIvarWithFieldInternal(a2, *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), a3);
}

void *__ResolveIvarSet_block_invoke_8(uint64_t a1, void *a2, int a3)
{
  return TRIPBSetInt32IvarWithFieldInternal(a2, *(void *)(a1 + 32), a3, *(unsigned __int8 *)(a1 + 40));
}

void *__ResolveIvarSet_block_invoke_9(uint64_t a1, void *a2, uint64_t a3)
{
  return TRIPBSetInt64IvarWithFieldInternal(a2, *(void *)(a1 + 32), a3, *(unsigned __int8 *)(a1 + 40));
}

void *__ResolveIvarSet_block_invoke_10(uint64_t a1, void *a2, int a3)
{
  return TRIPBSetInt32IvarWithFieldInternal(a2, *(void *)(a1 + 32), a3, *(unsigned __int8 *)(a1 + 40));
}

void *__ResolveIvarSet_block_invoke_11(uint64_t a1, void *a2, uint64_t a3)
{
  return TRIPBSetInt64IvarWithFieldInternal(a2, *(void *)(a1 + 32), a3, *(unsigned __int8 *)(a1 + 40));
}

void *__ResolveIvarSet_block_invoke_12(uint64_t a1, void *a2, int a3)
{
  return TRIPBSetUInt32IvarWithFieldInternal(a2, *(void *)(a1 + 32), a3, *(unsigned __int8 *)(a1 + 40));
}

void *__ResolveIvarSet_block_invoke_13(uint64_t a1, void *a2, uint64_t a3)
{
  return TRIPBSetUInt64IvarWithFieldInternal(a2, *(void *)(a1 + 32), a3, *(unsigned __int8 *)(a1 + 40));
}

void *__ResolveIvarSet_block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(unsigned __int8 *)(a1 + 40);
  id v6 = a3;
  return TRIPBSetRetainedObjectIvarWithFieldInternal(a2, v4, v6, v5);
}

void *__ResolveIvarSet_block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(unsigned __int8 *)(a1 + 40);
  id v6 = a3;
  return TRIPBSetRetainedObjectIvarWithFieldInternal(a2, v4, v6, v5);
}

void *__ResolveIvarSet_block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(unsigned __int8 *)(a1 + 40);
  id v6 = a3;
  return TRIPBSetRetainedObjectIvarWithFieldInternal(a2, v4, v6, v5);
}

void *__ResolveIvarSet_block_invoke_18(uint64_t a1, void *a2, uint64_t a3)
{
  return TRIPBSetEnumIvarWithFieldInternal(a2, *(void **)(a1 + 32), a3, *(unsigned __int8 *)(a1 + 40));
}

TRIPBFileDescriptor *TRITrishadowEvaluationRoot_FileDescriptor()
{
  uint64_t result = (TRIPBFileDescriptor *)TRITrishadowEvaluationRoot_FileDescriptor_descriptor;
  if (!TRITrishadowEvaluationRoot_FileDescriptor_descriptor)
  {
    uint64_t result = [[TRIPBFileDescriptor alloc] initWithPackage:@"TRI" objcPrefix:@"TRI" syntax:2];
    TRITrishadowEvaluationRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

uint64_t TRIShadowEvaluation_ClearTypeOneOfCase(void *a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "descriptor"), "oneofs"), "objectAtIndex:", 0);
  return TRIPBMaybeClearOneof((uint64_t)a1, v2, 0xFFFFFFFFLL, 0);
}

unint64_t TRIMLRuntimeSchedulingPolicy_QOS_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRIMLRuntimeSchedulingPolicy_QOS_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRIMLRuntimeSchedulingPolicy_QOS" valueNames:"Background" values:&TRIMLRuntimeSchedulingPolicy_QOS_EnumDescriptor_values count:2 enumVerifier:TRIMLRuntimeSchedulingPolicy_QOS_IsValidValue];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRIMLRuntimeSchedulingPolicy_QOS_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRIMLRuntimeSchedulingPolicy_QOS_EnumDescriptor_descriptor);
}

BOOL TRIMLRuntimeSchedulingPolicy_QOS_IsValidValue(unsigned int a1)
{
  return a1 < 2;
}

TRIPBFileDescriptor *TRITriclientBackgroundMltaskRoot_FileDescriptor()
{
  uint64_t result = (TRIPBFileDescriptor *)TRITriclientBackgroundMltaskRoot_FileDescriptor_descriptor;
  if (!TRITriclientBackgroundMltaskRoot_FileDescriptor_descriptor)
  {
    uint64_t result = [[TRIPBFileDescriptor alloc] initWithPackage:@"TRI" objcPrefix:@"TRI" syntax:2];
    TRITriclientBackgroundMltaskRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

void CopyWorker(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id)[a2 copy];
  [a3 addField:v4];
}

uint64_t TRIPBUnknownFieldSetSerializedSize(uint64_t a1, void *a2, void *a3)
{
  uint64_t result = [a2 serializedSize];
  *a3 += result;
  return result;
}

uint64_t TRIPBUnknownFieldSetWriteAsMessageSetTo(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "writeAsMessageSetExtensionToOutput:");
}

uint64_t TRIPBUnknownFieldSetSerializedSizeAsMessageSet(uint64_t a1, void *a2, void *a3)
{
  uint64_t result = [a2 serializedSizeAsMessageSetExtension];
  *a3 += result;
  return result;
}

void TRIPBUnknownFieldSetMergeUnknownFields(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = [a2 number];
  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Zero is not a valid field number."];
  }
  id v6 = (void *)[a3 mutableFieldForNumber:v5 create:0];
  if (v6)
  {
    [v6 mergeFromField:a2];
  }
  else
  {
    id v7 = (id)[a2 copy];
    [a3 addField:v7];
  }
}

uint64_t TRILogTimeReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 24) |= 2u;
        while (1)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
          *(void *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0) {
            goto LABEL_49;
          }
          v24 += 7;
          BOOL v14 = v25++ >= 9;
          if (v14)
          {
            LODWORD(v26) = 0;
            goto LABEL_51;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_49:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_51:
        uint64_t v36 = 16;
      }
      else
      {
        if (v17 != 2)
        {
          if (v17 == 1)
          {
            char v18 = 0;
            unsigned int v19 = 0;
            uint64_t v20 = 0;
            *(unsigned char *)(a1 + 24) |= 1u;
            while (1)
            {
              uint64_t v21 = *v3;
              unint64_t v22 = *(void *)(a2 + v21);
              if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
              *(void *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0) {
                goto LABEL_45;
              }
              v18 += 7;
              BOOL v14 = v19++ >= 9;
              if (v14)
              {
                uint64_t v20 = 0;
                goto LABEL_47;
              }
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_45:
            if (*(unsigned char *)(a2 + *v5)) {
              uint64_t v20 = 0;
            }
LABEL_47:
            *(void *)(a1 + _Block_object_dispose(&STACK[0x430], 8) = v20;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 24) |= 4u;
        while (1)
        {
          uint64_t v32 = *v3;
          unint64_t v33 = *(void *)(a2 + v32);
          if (v33 == -1 || v33 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
          *(void *)(a2 + v32) = v33 + 1;
          v26 |= (unint64_t)(v34 & 0x7F) << v30;
          if ((v34 & 0x80) == 0) {
            goto LABEL_53;
          }
          v30 += 7;
          BOOL v14 = v31++ >= 9;
          if (v14)
          {
            LODWORD(v26) = 0;
            goto LABEL_55;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_53:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_55:
        uint64_t v36 = 20;
      }
      *(_DWORD *)(a1 + v36) = v26;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t TRIPBFieldTag(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  if ((*(_WORD *)(v1 + 28) & 0xF04) != 0) {
    int v2 = 2;
  }
  else {
    int v2 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v1 + 30)];
  }
  return v2 | (8 * *(_DWORD *)(v1 + 16));
}

uint64_t TRIPBFieldAlternateTag(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  __int16 v2 = *(_WORD *)(v1 + 28);
  if ((v2 & 2) == 0)
  {
    id v4 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "uint32_t TRIPBFieldAlternateTag(TRIPBFieldDescriptor *)"), @"TRIPBDescriptor.m", 455, @"Only valid on repeated fields");
    if ((*(_WORD *)(v1 + 28) & 4) == 0) {
      goto LABEL_3;
    }
LABEL_5:
    int v3 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v1 + 30)];
    return v3 | (8 * *(_DWORD *)(v1 + 16));
  }
  if ((v2 & 4) != 0) {
    goto LABEL_5;
  }
LABEL_3:
  int v3 = 2;
  return v3 | (8 * *(_DWORD *)(v1 + 16));
}

void CopyKeyValue(void *key, void *value, CFMutableDictionaryRef theDict)
{
}

uint64_t TRILevel_ClearLevelOneOfCase(void *a1)
{
  __int16 v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "descriptor"), "oneofs"), "objectAtIndex:", 0);
  return TRIPBMaybeClearOneof((uint64_t)a1, v2, 0xFFFFFFFFLL, 0);
}

uint64_t TRITrialDownloadSettingsFieldsReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 16) |= 1u;
        while (1)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
          *(void *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0) {
            goto LABEL_49;
          }
          v24 += 7;
          BOOL v14 = v25++ >= 9;
          if (v14)
          {
            LODWORD(v26) = 0;
            goto LABEL_51;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_49:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_51:
        *(_DWORD *)(a1 + _Block_object_dispose(&STACK[0x430], 8) = v26;
      }
      else
      {
        if (v17 == 2)
        {
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v32 = 0;
          *(unsigned char *)(a1 + 16) |= 4u;
          while (1)
          {
            uint64_t v33 = *v3;
            unint64_t v34 = *(void *)(a2 + v33);
            if (v34 == -1 || v34 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
            *(void *)(a2 + v33) = v34 + 1;
            v32 |= (unint64_t)(v35 & 0x7F) << v30;
            if ((v35 & 0x80) == 0) {
              goto LABEL_53;
            }
            v30 += 7;
            BOOL v14 = v31++ >= 9;
            if (v14)
            {
              uint64_t v32 = 0;
              goto LABEL_55;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_53:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v32 = 0;
          }
LABEL_55:
          BOOL v37 = v32 != 0;
          uint64_t v38 = 13;
        }
        else
        {
          if (v17 != 1)
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            continue;
          }
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 16) |= 2u;
          while (1)
          {
            uint64_t v21 = *v3;
            unint64_t v22 = *(void *)(a2 + v21);
            if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0) {
              goto LABEL_45;
            }
            v18 += 7;
            BOOL v14 = v19++ >= 9;
            if (v14)
            {
              uint64_t v20 = 0;
              goto LABEL_47;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_45:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v20 = 0;
          }
LABEL_47:
          BOOL v37 = v20 != 0;
          uint64_t v38 = 12;
        }
        *(unsigned char *)(a1 + v3_Block_object_dispose(&STACK[0x430], 8) = v37;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL TRIMLRuntimeDimensionsReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 == 2)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 16;
        goto LABEL_24;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 24;
LABEL_24:
        uint64_t v20 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadString();
    uint64_t v19 = 8;
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t TRILogNamespaceReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_31;
        case 2u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 8;
          goto LABEL_31;
        case 3u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 40) |= 2u;
          while (2)
          {
            uint64_t v23 = *v3;
            unint64_t v24 = *(void *)(a2 + v23);
            if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                BOOL v14 = v21++ >= 9;
                if (v14)
                {
                  uint64_t v22 = 0;
                  goto LABEL_42;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v22 = 0;
          }
LABEL_42:
          *(unsigned char *)(a1 + 36) = v22 != 0;
          continue;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
LABEL_31:
          uint64_t v26 = *(void **)(a1 + v18);
          *(void *)(a1 + v1_Block_object_dispose(&STACK[0x430], 8) = v17;

          continue;
        case 5u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          *(unsigned char *)(a1 + 40) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v30 = *v3;
        unint64_t v31 = *(void *)(a2 + v30);
        if (v31 == -1 || v31 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
        *(void *)(a2 + v30) = v31 + 1;
        v29 |= (unint64_t)(v32 & 0x7F) << v27;
        if ((v32 & 0x80) == 0) {
          goto LABEL_44;
        }
        v27 += 7;
        BOOL v14 = v28++ >= 9;
        if (v14)
        {
          LODWORD(v29) = 0;
          goto LABEL_46;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_44:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v29) = 0;
      }
LABEL_46:
      *(_DWORD *)(a1 + 32) = v29;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL TRILogEventReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 10) {
        break;
      }
      if (v17 == 2)
      {
        uint64_t v19 = PBReaderReadString();
        uint64_t v18 = *(TRILogContext **)(a1 + 24);
        *(void *)(a1 + 24) = v19;
        goto LABEL_28;
      }
      if (v17 == 1)
      {
        uint64_t v18 = objc_alloc_init(TRILogContext);
        objc_storeStrong((id *)(a1 + 8), v18);
        if (!PBReaderPlaceMark() || (TRILogContextReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_33;
        }
        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_30:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = objc_alloc_init(TRIDenormalizedEvent);
    objc_storeStrong((id *)(a1 + 16), v18);
    if (!PBReaderPlaceMark() || !TRIDenormalizedEventReadFrom((id *)&v18->super.super.isa, a2))
    {
LABEL_33:

      return 0;
    }
LABEL_26:
    PBReaderRecallMark();
LABEL_28:

    goto LABEL_30;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL TRITrialOnDemandFactorFieldsReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose(&STACK[0x430], 8) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1935E9538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
}

uint64_t TRITrialDownloadStatusFieldsReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 12) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_31:
        *(_DWORD *)(a1 + _Block_object_dispose(&STACK[0x430], 8) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

TRIPBFileDescriptor *TRICoreMlassignmentRoot_FileDescriptor()
{
  uint64_t result = (TRIPBFileDescriptor *)TRICoreMlassignmentRoot_FileDescriptor_descriptor;
  if (!TRICoreMlassignmentRoot_FileDescriptor_descriptor)
  {
    uint64_t result = [[TRIPBFileDescriptor alloc] initWithPackage:@"TRI" objcPrefix:@"TRI" syntax:2];
    TRICoreMlassignmentRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

double TRIPBCodedInputStreamReadDouble(void *a1)
{
  CheckSize((uint64_t)a1, 8);
  uint64_t v2 = a1[2];
  double result = *(double *)(*a1 + v2);
  a1[2] = v2 + 8;
  return result;
}

float TRIPBCodedInputStreamReadFloat(void *a1)
{
  CheckSize((uint64_t)a1, 4);
  uint64_t v2 = a1[2];
  float result = *(float *)(*a1 + v2);
  a1[2] = v2 + 4;
  return result;
}

uint64_t TRIPBCodedInputStreamReadUInt32(uint64_t *a1)
{
  return ReadRawVarint64(a1);
}

uint64_t TRIPBCodedInputStreamReadInt32(uint64_t *a1)
{
  return ReadRawVarint64(a1);
}

uint64_t TRIPBCodedInputStreamReadFixed64(void *a1)
{
  CheckSize((uint64_t)a1, 8);
  uint64_t v2 = a1[2];
  uint64_t result = *(void *)(*a1 + v2);
  a1[2] = v2 + 8;
  return result;
}

uint64_t TRIPBCodedInputStreamReadFixed32(void *a1)
{
  CheckSize((uint64_t)a1, 4);
  uint64_t v2 = a1[2];
  uint64_t result = *(unsigned int *)(*a1 + v2);
  a1[2] = v2 + 4;
  return result;
}

uint64_t TRIPBCodedInputStreamReadEnum(uint64_t *a1)
{
  return ReadRawVarint64(a1);
}

uint64_t TRIPBCodedInputStreamReadSFixed32(void *a1)
{
  CheckSize((uint64_t)a1, 4);
  uint64_t v2 = a1[2];
  uint64_t result = *(unsigned int *)(*a1 + v2);
  a1[2] = v2 + 4;
  return result;
}

uint64_t TRIPBCodedInputStreamReadSFixed64(void *a1)
{
  CheckSize((uint64_t)a1, 8);
  uint64_t v2 = a1[2];
  uint64_t result = *(void *)(*a1 + v2);
  a1[2] = v2 + 8;
  return result;
}

uint64_t TRIPBCodedInputStreamReadSInt32(uint64_t *a1)
{
  unsigned int RawVarint64 = ReadRawVarint64(a1);
  return -(RawVarint64 & 1) ^ (RawVarint64 >> 1);
}

unint64_t TRIPBCodedInputStreamReadSInt64(uint64_t *a1)
{
  unint64_t RawVarint64 = ReadRawVarint64(a1);
  return -(uint64_t)(RawVarint64 & 1) ^ (RawVarint64 >> 1);
}

BOOL TRIPBCodedInputStreamReadBool(uint64_t *a1)
{
  return ReadRawVarint64(a1) != 0;
}

BOOL TRIPBCodedInputStreamIsAtEnd(void *a1)
{
  uint64_t v1 = a1[2];
  return v1 == a1[1] || v1 == a1[3];
}

uint64_t TRIPBCodedInputStreamReadRetainedBytes(uint64_t *a1)
{
  unsigned int RawVarint64 = ReadRawVarint64(a1);
  if ((RawVarint64 & 0x80000000) != 0) {
    return 0;
  }
  CheckSize((uint64_t)a1, RawVarint64);
  uint64_t result = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:*a1 + a1[2] length:RawVarint64];
  a1[2] += RawVarint64;
  return result;
}

uint64_t TRIPBCodedInputStreamReadRetainedBytesNoCopy(uint64_t *a1)
{
  unsigned int RawVarint64 = ReadRawVarint64(a1);
  if ((RawVarint64 & 0x80000000) != 0) {
    return 0;
  }
  CheckSize((uint64_t)a1, RawVarint64);
  uint64_t result = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:*a1 + a1[2] length:RawVarint64 freeWhenDone:0];
  a1[2] += RawVarint64;
  return result;
}

unint64_t TRIPBCodedInputStreamPushLimit(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a1 + 24);
  unint64_t v4 = *(void *)(a1 + 16) + a2;
  if (v4 > v3) {
    RaiseException(-102, 0);
  }
  *(void *)(a1 + 24) = v4;
  return v3;
}

uint64_t TRIPBCodedInputStreamPopLimit(uint64_t result, uint64_t a2)
{
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t TRIPBCodedInputStreamBytesUntilLimit(uint64_t a1)
{
  return *(void *)(a1 + 24) - *(void *)(a1 + 16);
}

uint64_t TRIPBCodedInputStreamCheckLastTagWas(uint64_t result, int a2)
{
  if (*(_DWORD *)(result + 32) != a2) {
    return RaiseException(-103, @"Unexpected tag read");
  }
  return result;
}

TRIPBFileDescriptor *TRITriclientFactorPackRoot_FileDescriptor()
{
  uint64_t result = (TRIPBFileDescriptor *)TRITriclientFactorPackRoot_FileDescriptor_descriptor;
  if (!TRITriclientFactorPackRoot_FileDescriptor_descriptor)
  {
    uint64_t result = [[TRIPBFileDescriptor alloc] initWithPackage:@"TRI" objcPrefix:@"TRI" syntax:2];
    TRITriclientFactorPackRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

uint64_t TRIMetricReadFrom(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 32;
          goto LABEL_34;
        case 2u:
          *(unsigned char *)(a1 + 48) |= 1u;
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v22 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v23 = 0;
          }
          *(void *)(a1 + _Block_object_dispose(&STACK[0x430], 8) = v23;
          continue;
        case 3u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 48) |= 2u;
          break;
        case 4u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 24;
          goto LABEL_34;
        case 5u:
          uint64_t v18 = PBReaderReadData();
          uint64_t v19 = 40;
LABEL_34:
          unint64_t v31 = *(void **)(a1 + v19);
          *(void *)(a1 + v19) = v18;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v27 = *v3;
        uint64_t v28 = *(void *)(a2 + v27);
        unint64_t v29 = v28 + 1;
        if (v28 == -1 || v29 > *(void *)(a2 + *v4)) {
          break;
        }
        char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
        *(void *)(a2 + v27) = v29;
        v26 |= (unint64_t)(v30 & 0x7F) << v24;
        if ((v30 & 0x80) == 0) {
          goto LABEL_36;
        }
        v24 += 7;
        BOOL v15 = v25++ >= 9;
        if (v15)
        {
          uint64_t v26 = 0;
          goto LABEL_38;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_36:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v26 = 0;
      }
LABEL_38:
      *(void *)(a1 + 16) = v26;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t TRITrialAssetPurgeFieldsReadFrom(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 12) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_31:
        *(_DWORD *)(a1 + _Block_object_dispose(&STACK[0x430], 8) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t TRIPBRootExtensionKeyRetain(uint64_t a1, uint64_t a2)
{
  return a2;
}

CFStringRef TRIPBRootExtensionCopyKeyDescription(char *cStr)
{
  return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], cStr, 0x8000100u);
}

BOOL TRIPBRootExtensionKeyEqual(const char *a1, const char *a2)
{
  return strcmp(a1, a2) == 0;
}

uint64_t TRIPBRootExtensionKeyHash(unsigned char *a1)
{
  LOBYTE(v1) = *a1;
  if (*a1)
  {
    unsigned int v2 = 0;
    unsigned int v3 = 1;
    do
    {
      unsigned int v2 = (1025 * (v2 + (char)v1)) ^ ((1025 * (v2 + (char)v1)) >> 6);
      int v1 = a1[v3++];
    }
    while (v1);
    unsigned int v4 = 9 * v2;
  }
  else
  {
    unsigned int v4 = 0;
  }
  return 32769 * (v4 ^ (v4 >> 11));
}

uint64_t TRIPBResolveExtensionClassMethod(objc_class *a1, const char *a2)
{
  uint64_t result = (uint64_t)ExtensionForName(a1, a2);
  if (result)
  {
    uint64_t v5 = result;
    id v6 = TRIPBMessageEncodingForSelector(sel_getClassValue, 0);
    SEL Name = class_getName(a1);
    MetaClass = objc_getMetaClass(Name);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __TRIPBResolveExtensionClassMethod_block_invoke;
    block[3] = &unk_1E576C000;
    block[4] = v5;
    unsigned int v9 = imp_implementationWithBlock(block);
    return class_addMethod(MetaClass, a2, v9, v6) || TRIPBClassHasSel(MetaClass, a2);
  }
  return result;
}

const void *ExtensionForName(objc_class *a1, SEL sel)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  SEL Name = sel_getName(sel);
  int v5 = *(unsigned __int8 *)Name;
  if (v5 == 95) {
    return 0;
  }
  id v7 = Name;
  uint64_t v8 = 1;
  if (*Name)
  {
    while (v5 != 58)
    {
      int v5 = Name[v8++];
      if (!v5) {
        goto LABEL_6;
      }
    }
    return 0;
  }
LABEL_6:
  unsigned int v9 = class_getName(a1);
  size_t v10 = strlen(v9);
  MEMORY[0x1F4188790](v10, v11);
  char v13 = (char *)v15 - v12;
  memcpy((char *)v15 - v12, v9, v10);
  v13[v10] = 95;
  memcpy(&v13[v10 + 1], v7, v8 - 1);
  v13[v10 + v8] = 0;
  if (!_MergedGlobals_16) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel, a1, @"TRIPBRootObject.m", 190, @"Startup order broken!");
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_1EB3EE598, 0xFFFFFFFFFFFFFFFFLL);
  Value = CFDictionaryGetValue((CFDictionaryRef)_MergedGlobals_16, v13);
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_1EB3EE598);
  return Value;
}

uint64_t __TRIPBResolveExtensionClassMethod_block_invoke(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t TRITrialMobileAssetOriginFieldsReadFrom(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = (int *)MEMORY[0x1E4F940E8];
  unsigned int v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 12) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_31:
        *(unsigned char *)(a1 + _Block_object_dispose(&STACK[0x430], 8) = v19 != 0;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t TRITrialRolloutFieldsReadFrom(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = (int *)MEMORY[0x1E4F940E8];
  unsigned int v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_24;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
          goto LABEL_24;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
LABEL_24:
          uint64_t v20 = *(void **)(a1 + v18);
          *(void *)(a1 + v1_Block_object_dispose(&STACK[0x430], 8) = v17;

          continue;
        case 5u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 36) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v24 = *v3;
        unint64_t v25 = *(void *)(a2 + v24);
        if (v25 == -1 || v25 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
        *(void *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0) {
          goto LABEL_33;
        }
        v21 += 7;
        BOOL v14 = v22++ >= 9;
        if (v14)
        {
          LODWORD(v23) = 0;
          goto LABEL_35;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v23) = 0;
      }
LABEL_35:
      *(_DWORD *)(a1 + 32) = v23;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t TRITrialBMLTFieldsReadFrom(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = (int *)MEMORY[0x1E4F940E8];
  unsigned int v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 6)
      {
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 28) |= 1u;
        while (1)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
          *(void *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0) {
            goto LABEL_34;
          }
          v20 += 7;
          BOOL v14 = v21++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_36;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_36:
        *(_DWORD *)(a1 + 24) = v22;
      }
      else
      {
        if (v17 == 5)
        {
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 8;
        }
        else
        {
          if (v17 != 1)
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            continue;
          }
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 16;
        }
        char v26 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL ArrayDefault_IsValidValue(int a1)
{
  return a1 != -72499473;
}

TRIPBFileDescriptor *TRIPBWrappersRoot_FileDescriptor()
{
  uint64_t result = (TRIPBFileDescriptor *)TRIPBWrappersRoot_FileDescriptor_descriptor;
  if (!TRIPBWrappersRoot_FileDescriptor_descriptor)
  {
    uint64_t result = [[TRIPBFileDescriptor alloc] initWithPackage:@"google.protobuf" objcPrefix:@"TRIPB" syntax:3];
    TRIPBWrappersRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

uint64_t TRIPBDictionaryComputeSizeInternalHelper(void *a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int8 *)(*(void *)(a2 + 8) + 30);
  unsigned int v4 = (void *)[a1 keyEnumerator];
  uint64_t v5 = [v4 nextObject];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = 0;
    do
    {
      char v8 = (void *)[a1 objectForKeyedSubscript:v6];
      uint64_t v9 = [v6 lengthOfBytesUsingEncoding:4];
      if (v9 >> 28) {
        uint64_t v10 = 5;
      }
      else {
        uint64_t v10 = 4;
      }
      if (v9 < 0x200000) {
        uint64_t v10 = 3;
      }
      if (v9 < 0x4000) {
        uint64_t v10 = 2;
      }
      if (v9 < 0x80) {
        uint64_t v10 = 1;
      }
      uint64_t v11 = v9 + v10 + ComputeDictObjectFieldSize(v8, v3) + 1;
      if (v11 >> 28) {
        uint64_t v12 = 5;
      }
      else {
        uint64_t v12 = 4;
      }
      if (v11 < 0x200000) {
        uint64_t v12 = 3;
      }
      if (v11 < 0x4000) {
        uint64_t v12 = 2;
      }
      if (v11 < 0x80) {
        uint64_t v12 = 1;
      }
      v7 += v11 + v12;
      id v6 = (void *)[v4 nextObject];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  unsigned int v13 = 8 * *(_DWORD *)(*(void *)(a2 + 8) + 16);
  if (v13 >= 0x80)
  {
    if (v13 >= 0x4000)
    {
      if (v13 >= 0x200000)
      {
        if (v13 >> 28) {
          uint64_t v14 = 5;
        }
        else {
          uint64_t v14 = 4;
        }
      }
      else
      {
        uint64_t v14 = 3;
      }
    }
    else
    {
      uint64_t v14 = 2;
    }
  }
  else
  {
    uint64_t v14 = 1;
  }
  return v7 + [a1 count] * v14;
}

uint64_t ComputeDictObjectFieldSize(void *a1, unsigned int a2)
{
  switch(a2)
  {
    case 0xDu:
      uint64_t v3 = [a1 length];
      break;
    case 0xEu:
      uint64_t v3 = [a1 lengthOfBytesUsingEncoding:4];
      break;
    case 0xFu:
      uint64_t v3 = [a1 serializedSize];
      break;
    default:
      uint64_t v9 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "size_t ComputeDictObjectFieldSize(id, uint32_t, TRIPBDataType)"), @"TRIPBDictionary.m", 311, @"Unexpected type %d", a2);
      return 0;
  }
  uint64_t v4 = 1;
  uint64_t v5 = 2;
  uint64_t v6 = 3;
  uint64_t v7 = 4;
  if (v3 >> 28) {
    uint64_t v7 = 5;
  }
  if (v3 >= 0x200000) {
    uint64_t v6 = v7;
  }
  if (v3 >= 0x4000) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0x80) {
    uint64_t v4 = v5;
  }
  return v3 + v4 + 1;
}

uint64_t TRIPBDictionaryWriteToStreamInternalHelper(void *a1, void *a2, void *a3)
{
  if ([a3 mapKeyDataType] != 14)
  {
    int v16 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void TRIPBDictionaryWriteToStreamInternalHelper(TRIPBCodedOutputStream *, NSDictionary *, TRIPBFieldDescriptor *)"), @"TRIPBDictionary.m", 349, @"Unexpected key type");
  }
  uint64_t v6 = a3[1];
  unsigned int v7 = *(unsigned __int8 *)(v6 + 30);
  int v8 = *(_DWORD *)(v6 + 16);
  uint64_t v9 = (void *)[a2 keyEnumerator];
  uint64_t result = [v9 nextObject];
  if (result)
  {
    uint64_t v11 = (void *)result;
    uint64_t v12 = (8 * v8) | 2u;
    do
    {
      unsigned int v13 = (void *)[a2 objectForKeyedSubscript:v11];
      [a1 writeInt32NoTag:v12];
      unsigned int v14 = [v11 lengthOfBytesUsingEncoding:4];
      int v15 = 4;
      if (v14 >> 28) {
        int v15 = 5;
      }
      if (v14 < 0x200000) {
        int v15 = 3;
      }
      if (v14 < 0x4000) {
        int v15 = 2;
      }
      if (v14 < 0x80) {
        int v15 = 1;
      }
      objc_msgSend(a1, "writeInt32NoTag:", v14 + v15 + ComputeDictObjectFieldSize(v13, v7) + 1);
      [a1 writeString:1 value:v11];
      WriteDictObjectField(a1, (uint64_t)v13, v7);
      uint64_t result = [v9 nextObject];
      uint64_t v11 = (void *)result;
    }
    while (result);
  }
  return result;
}

uint64_t WriteDictObjectField(void *a1, uint64_t a2, unsigned int a3)
{
  switch(a3)
  {
    case 0xDu:
      return [a1 writeBytes:2 value:a2];
    case 0xEu:
      return [a1 writeString:2 value:a2];
    case 0xFu:
      return [a1 writeMessage:2 value:a2];
    default:
      uint64_t v5 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      return objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void WriteDictObjectField(TRIPBCodedOutputStream *, id, uint32_t, TRIPBDataType)"), @"TRIPBDictionary.m", 324, @"Unexpected type %d", a3);
  }
}

BOOL TRIPBDictionaryIsInitializedInternalHelper(void *a1, void *a2)
{
  if ([a2 mapKeyDataType] != 14)
  {
    int v8 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "BOOL TRIPBDictionaryIsInitializedInternalHelper(NSDictionary *, TRIPBFieldDescriptor *)"), @"TRIPBDictionary.m", 370, @"Unexpected key type");
  }
  if (*(unsigned char *)(a2[1] + 30) != 15)
  {
    uint64_t v9 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "BOOL TRIPBDictionaryIsInitializedInternalHelper(NSDictionary *, TRIPBFieldDescriptor *)"), @"TRIPBDictionary.m", 371, @"Unexpected value type");
  }
  uint64_t v4 = (void *)[a1 objectEnumerator];
  do
  {
    uint64_t v5 = (void *)[v4 nextObject];
    uint64_t v6 = v5;
  }
  while (v5 && ([v5 isInitialized] & 1) != 0);
  return v6 == 0;
}

void TRIPBDictionaryReadEntry(void *a1, uint64_t *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v10 = [a4 mapKeyDataType];
  uint64_t v11 = *(unsigned __int8 *)(a4[1] + 30);
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  if (v11 == 17) {
    uint64_t v22 = (__CFString *)[a4 defaultValue];
  }
  int v12 = TRIPBWireFormatForType_format[v10] | 8;
  int v13 = TRIPBWireFormatForType_format[v11] | 0x10;
  while (1)
  {
    while (1)
    {
      uint64_t Tag = TRIPBCodedInputStreamReadTag((uint64_t)(a2 + 1));
      if (Tag == v12)
      {
        int v15 = (id *)&v23;
        int v16 = a2;
        int v17 = v10;
        goto LABEL_8;
      }
      uint64_t v18 = Tag;
      if (Tag != v13) {
        break;
      }
      int v15 = (id *)&v22;
      int v16 = a2;
      int v17 = v11;
LABEL_8:
      ReadValue(v16, v15, v17, a3, a4);
    }
    if (!Tag) {
      break;
    }
    if (([a2 skipField:Tag] & 1) == 0) {
      goto LABEL_32;
    }
  }
  uint64_t v19 = v23;
  if (v10 == 14 && !v23)
  {
    uint64_t v19 = &stru_1EE43FA58;
    uint64_t v23 = v19;
  }
  char v20 = v22;
  if ((v11 - 13) > 3u || v22) {
    goto LABEL_25;
  }
  switch(v11)
  {
    case 0xD:
      unsigned int v21 = (__CFString *)(id)TRIPBEmptyNSData();
LABEL_23:
      char v20 = v21;
      uint64_t v22 = v21;
      goto LABEL_25;
    case 0xF:
      unsigned int v21 = (__CFString *)objc_alloc_init((Class)objc_msgSend(a4, "msgClass", v18));
      goto LABEL_23;
    case 0xE:
      unsigned int v21 = &stru_1EE43FA58;
      goto LABEL_23;
  }
  char v20 = 0;
LABEL_25:
  if (v10 == 14 && (v11 - 13) <= 3u)
  {
    [a1 setObject:v20 forKey:v19];
    goto LABEL_34;
  }
  if (v11 != 17
    || objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "descriptor", v18), "file"), "syntax") == 3
    || [a4 isValidEnumValue:v20])
  {
    [a1 setTRIPBGenericValue:&v22 forTRIPBGenericValueKey:&v23];
  }
  else
  {
    objc_msgSend(a5, "addUnknownMapEntry:value:", *(unsigned int *)(a4[1] + 16), objc_msgSend(a1, "serializedDataForUnknownValue:forKey:keyDataType:", v20, &v23, v10));
  }
LABEL_32:
  if ((v10 - 13) > 3u) {
    goto LABEL_35;
  }
  uint64_t v19 = v23;
LABEL_34:

LABEL_35:
  if ((v11 - 13) <= 3u) {
}
  }

void ReadValue(uint64_t *a1, id *a2, int a3, uint64_t a4, void *a5)
{
  switch(a3)
  {
    case 0:
      *(unsigned char *)a2 = ReadRawVarint64(a1 + 1) != 0;
      return;
    case 1:
    case 2:
      CheckSize((uint64_t)(a1 + 1), 4);
      uint64_t v7 = a1[3];
      int v8 = *(_DWORD *)(a1[1] + v7);
      a1[3] = v7 + 4;
      goto LABEL_10;
    case 3:
      CheckSize((uint64_t)(a1 + 1), 4);
      uint64_t v12 = a1[3];
      int v13 = *(_DWORD *)(a1[1] + v12);
      a1[3] = v12 + 4;
      *(_DWORD *)a2 = v13;
      return;
    case 4:
    case 5:
      CheckSize((uint64_t)(a1 + 1), 8);
      uint64_t v9 = a1[3];
      uint64_t v10 = *(void **)(a1[1] + v9);
      a1[3] = v9 + 8;
      goto LABEL_12;
    case 6:
      CheckSize((uint64_t)(a1 + 1), 8);
      uint64_t v14 = a1[3];
      int v15 = *(void **)(a1[1] + v14);
      a1[3] = v14 + 8;
      *a2 = v15;
      return;
    case 7:
    case 11:
    case 17:
      *(_DWORD *)a2 = ReadRawVarint64(a1 + 1);
      return;
    case 8:
    case 12:
      uint64_t RawVarint64 = ReadRawVarint64(a1 + 1);
      goto LABEL_15;
    case 9:
      unsigned int v16 = ReadRawVarint64(a1 + 1);
      int v8 = -(v16 & 1) ^ (v16 >> 1);
LABEL_10:
      *(_DWORD *)a2 = v8;
      return;
    case 10:
      unint64_t v17 = ReadRawVarint64(a1 + 1);
      uint64_t v10 = (void *)(-(uint64_t)(v17 & 1) ^ (v17 >> 1));
LABEL_12:
      *a2 = v10;
      return;
    case 13:

      uint64_t RawVarint64 = TRIPBCodedInputStreamReadRetainedBytes(a1 + 1);
      goto LABEL_15;
    case 14:

      uint64_t RawVarint64 = (uint64_t)TRIPBCodedInputStreamReadRetainedString(a1 + 1);
LABEL_15:
      *a2 = (id)RawVarint64;
      break;
    case 15:
      id v19 = objc_alloc_init((Class)[a5 msgClass]);
      [a1 readMessage:v19 extensionRegistry:a4];

      *a2 = v19;
      break;
    case 16:
      char v20 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v21 = objc_msgSend(NSString, "stringWithUTF8String:", "void ReadValue(TRIPBCodedInputStream *, TRIPBGenericValue *, TRIPBDataType, TRIPBExtensionRegistry *, TRIPBFieldDescriptor *)");
      [v20 handleFailureInFunction:v21 file:@"TRIPBDictionary.m" lineNumber:445 description:@"Can't happen"];
      break;
    default:
      return;
  }
}

uint64_t ComputeDictUInt32FieldSize(unsigned int a1, int a2, unsigned int a3)
{
  if (a3 == 1)
  {
    unsigned int v5 = 8 * a2;
    uint64_t v6 = 6;
    uint64_t v7 = 7;
    uint64_t v8 = 8;
    if ((8 * a2) >> 28) {
      uint64_t v8 = 9;
    }
    if (v5 >= 0x200000) {
      uint64_t v7 = v8;
    }
    if (v5 >= 0x4000) {
      uint64_t v6 = v7;
    }
    if (v5 >= 0x80) {
      return v6;
    }
    else {
      return 5;
    }
  }
  else if (a3 == 11)
  {
    return TRIPBComputeUInt32Size(a2, a1);
  }
  else
  {
    uint64_t v9 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "size_t ComputeDictUInt32FieldSize(uint32_t, uint32_t, TRIPBDataType)"), @"TRIPBDictionary.m", 182, @"Unexpected type %d", a3);
    return 0;
  }
}

uint64_t WriteDictUInt32Field(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a4 == 1)
  {
    return [a1 writeFixed32:a3 value:a2];
  }
  else if (a4 == 11)
  {
    return [a1 writeUInt32:a3 value:a2];
  }
  else
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    return objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void WriteDictUInt32Field(TRIPBCodedOutputStream *, uint32_t, uint32_t, TRIPBDataType)"), @"TRIPBDictionary.m", 193, @"Unexpected type %d", a4);
  }
}

uint64_t ComputeDictInt32FieldSize(unsigned int a1, int a2, unsigned int a3)
{
  switch(a3)
  {
    case 2u:
      unsigned int v5 = 8 * a2;
      uint64_t v6 = 6;
      uint64_t v7 = 7;
      uint64_t v8 = 8;
      if ((8 * a2) >> 28) {
        uint64_t v8 = 9;
      }
      if (v5 >= 0x200000) {
        uint64_t v7 = v8;
      }
      if (v5 >= 0x4000) {
        uint64_t v6 = v7;
      }
      if (v5 >= 0x80) {
        return v6;
      }
      else {
        return 5;
      }
    case 9u:
      return TRIPBComputeSInt32Size(a2, a1);
    case 7u:
      return TRIPBComputeInt32Size(a2, a1);
    default:
      uint64_t v9 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "size_t ComputeDictInt32FieldSize(int32_t, uint32_t, TRIPBDataType)"), @"TRIPBDictionary.m", 159, @"Unexpected type %d", a3);
      return 0;
  }
}

uint64_t WriteDictInt32Field(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  switch(a4)
  {
    case 2u:
      return [a1 writeSFixed32:a3 value:a2];
    case 9u:
      return [a1 writeSInt32:a3 value:a2];
    case 7u:
      return [a1 writeInt32:a3 value:a2];
    default:
      uint64_t v6 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      return objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void WriteDictInt32Field(TRIPBCodedOutputStream *, int32_t, uint32_t, TRIPBDataType)"), @"TRIPBDictionary.m", 172, @"Unexpected type %d", a4);
  }
}

uint64_t ComputeDictUInt64FieldSize(unint64_t a1, int a2, unsigned int a3)
{
  if (a3 == 4)
  {
    unsigned int v10 = 8 * a2;
    uint64_t v11 = 10;
    uint64_t v12 = 11;
    uint64_t v13 = 12;
    if ((8 * a2) >> 28) {
      uint64_t v13 = 13;
    }
    if (v10 >= 0x200000) {
      uint64_t v12 = v13;
    }
    if (v10 >= 0x4000) {
      uint64_t v11 = v12;
    }
    if (v10 >= 0x80) {
      return v11;
    }
    else {
      return 9;
    }
  }
  else if (a3 == 12)
  {
    unsigned int v4 = 8 * a2;
    uint64_t v5 = 2;
    uint64_t v6 = 3;
    uint64_t v7 = 4;
    if ((8 * a2) >> 28) {
      uint64_t v7 = 5;
    }
    if (v4 >= 0x200000) {
      uint64_t v6 = v7;
    }
    if (v4 >= 0x4000) {
      uint64_t v5 = v6;
    }
    if (v4 >= 0x80) {
      uint64_t v8 = v5;
    }
    else {
      uint64_t v8 = 1;
    }
    return TRIPBComputeRawVarint64Size(a1) + v8;
  }
  else
  {
    uint64_t v14 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "size_t ComputeDictUInt64FieldSize(uint64_t, uint32_t, TRIPBDataType)"), @"TRIPBDictionary.m", 228, @"Unexpected type %d", a3);
    return 0;
  }
}

uint64_t WriteDictUInt64Field(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a4 == 4)
  {
    return [a1 writeFixed64:a3 value:a2];
  }
  else if (a4 == 12)
  {
    return [a1 writeUInt64:a3 value:a2];
  }
  else
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    return objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void WriteDictUInt64Field(TRIPBCodedOutputStream *, uint64_t, uint32_t, TRIPBDataType)"), @"TRIPBDictionary.m", 239, @"Unexpected type %d", a4);
  }
}

uint64_t ComputeDictInt64FieldSize(unint64_t a1, int a2, unsigned int a3)
{
  switch(a3)
  {
    case 5u:
      unsigned int v10 = 8 * a2;
      uint64_t v11 = 10;
      uint64_t v12 = 11;
      uint64_t v13 = 12;
      if ((8 * a2) >> 28) {
        uint64_t v13 = 13;
      }
      if (v10 >= 0x200000) {
        uint64_t v12 = v13;
      }
      if (v10 >= 0x4000) {
        uint64_t v11 = v12;
      }
      if (v10 >= 0x80) {
        return v11;
      }
      else {
        return 9;
      }
    case 0xAu:
      return TRIPBComputeSInt64Size(a2, a1);
    case 8u:
      unsigned int v4 = 8 * a2;
      uint64_t v5 = 2;
      uint64_t v6 = 3;
      uint64_t v7 = 4;
      if ((8 * a2) >> 28) {
        uint64_t v7 = 5;
      }
      if (v4 >= 0x200000) {
        uint64_t v6 = v7;
      }
      if (v4 >= 0x4000) {
        uint64_t v5 = v6;
      }
      if (v4 >= 0x80) {
        uint64_t v8 = v5;
      }
      else {
        uint64_t v8 = 1;
      }
      return TRIPBComputeRawVarint64Size(a1) + v8;
    default:
      uint64_t v14 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "size_t ComputeDictInt64FieldSize(int64_t, uint32_t, TRIPBDataType)"), @"TRIPBDictionary.m", 205, @"Unexpected type %d", a3);
      return 0;
  }
}

uint64_t WriteDictInt64Field(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  switch(a4)
  {
    case 5u:
      return [a1 writeSFixed64:a3 value:a2];
    case 0xAu:
      return [a1 writeSInt64:a3 value:a2];
    case 8u:
      return [a1 writeInt64:a3 value:a2];
    default:
      uint64_t v6 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      return objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void WriteDictInt64Field(TRIPBCodedOutputStream *, int64_t, uint32_t, TRIPBDataType)"), @"TRIPBDictionary.m", 218, @"Unexpected type %d", a4);
  }
}

uint64_t ComputeDictBoolFieldSize(int a1, unsigned int a2)
{
  if (a2)
  {
    uint64_t v9 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "size_t ComputeDictBoolFieldSize(BOOL, uint32_t, TRIPBDataType)"), @"TRIPBDictionary.m", 244, @"bad type: %d", a2);
  }
  unsigned int v3 = 8 * a1;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  uint64_t v6 = 5;
  if ((8 * a1) >> 28) {
    uint64_t v6 = 6;
  }
  if (v3 >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (v3 >= 0x80) {
    return v4;
  }
  else {
    return 2;
  }
}

uint64_t WriteDictBoolField(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a4)
  {
    uint64_t v9 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void WriteDictBoolField(TRIPBCodedOutputStream *, BOOL, uint32_t, TRIPBDataType)"), @"TRIPBDictionary.m", 250, @"bad type: %d", a4);
  }
  return [a1 writeBool:a3 value:a2];
}

uint64_t ComputeDictFloatFieldSize(unsigned int a1)
{
  if (a1 != 3)
  {
    unsigned int v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "size_t ComputeDictFloatFieldSize(float, uint32_t, TRIPBDataType)"), @"TRIPBDictionary.m", 268, @"bad type: %d", a1);
  }
  return 5;
}

uint64_t WriteDictFloatField(void *a1, unsigned int a2, double a3)
{
  int v3 = LODWORD(a3);
  if (a2 != 3)
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void WriteDictFloatField(TRIPBCodedOutputStream *, float, uint32_t, TRIPBDataType)"), @"TRIPBDictionary.m", 274, @"bad type: %d", a2);
  }
  LODWORD(a3) = v3;
  return [a1 writeFloat:2 value:a3];
}

uint64_t ComputeDictDoubleFieldSize(unsigned int a1)
{
  if (a1 != 6)
  {
    int v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "size_t ComputeDictDoubleFieldSize(double, uint32_t, TRIPBDataType)"), @"TRIPBDictionary.m", 280, @"bad type: %d", a1);
  }
  return 9;
}

uint64_t WriteDictDoubleField(void *a1, unsigned int a2, double a3)
{
  if (a2 != 6)
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void WriteDictDoubleField(TRIPBCodedOutputStream *, double, uint32_t, TRIPBDataType)"), @"TRIPBDictionary.m", 286, @"bad type: %d", a2);
  }
  return [a1 writeDouble:2 value:a3];
}

BOOL DictDefault_IsValidValue(int a1)
{
  return a1 != -72499473;
}

uint64_t ComputeDictEnumFieldSize(unsigned int a1, unsigned int a2)
{
  if (a2 != 17)
  {
    uint64_t v8 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "size_t ComputeDictEnumFieldSize(int32_t, uint32_t, TRIPBDataType)"), @"TRIPBDictionary.m", 256, @"bad type: %d", a2);
  }
  uint64_t v3 = 3;
  uint64_t v4 = 4;
  uint64_t v5 = 5;
  if (a1 >> 28) {
    uint64_t v5 = 6;
  }
  if (a1 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (a1 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (a1 >= 0x80) {
    return v3;
  }
  else {
    return 2;
  }
}

uint64_t WriteDictEnumField(void *a1, uint64_t a2, unsigned int a3)
{
  if (a3 != 17)
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void WriteDictEnumField(TRIPBCodedOutputStream *, int32_t, uint32_t, TRIPBDataType)"), @"TRIPBDictionary.m", 262, @"bad type: %d", a3);
  }
  return [a1 writeEnum:2 value:a2];
}

uint64_t ComputeDictStringFieldSize(void *a1, unsigned int a2)
{
  if (a2 != 14)
  {
    unsigned int v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "size_t ComputeDictStringFieldSize(NSString *, uint32_t, TRIPBDataType)"), @"TRIPBDictionary.m", 292, @"bad type: %d", a2);
  }
  uint64_t v3 = [a1 lengthOfBytesUsingEncoding:4];
  uint64_t v4 = 1;
  uint64_t v5 = 2;
  uint64_t v6 = 3;
  uint64_t v7 = 4;
  if (v3 >> 28) {
    uint64_t v7 = 5;
  }
  if (v3 >= 0x200000) {
    uint64_t v6 = v7;
  }
  if (v3 >= 0x4000) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0x80) {
    uint64_t v4 = v5;
  }
  return v3 + v4 + 1;
}

uint64_t WriteDictStringField(void *a1, uint64_t a2, unsigned int a3)
{
  if (a3 != 14)
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void WriteDictStringField(TRIPBCodedOutputStream *, NSString *, uint32_t, TRIPBDataType)"), @"TRIPBDictionary.m", 298, @"bad type: %d", a3);
  }
  return [a1 writeString:1 value:a2];
}

BOOL TRIDenormalizedEventReadFrom(id *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        unint64_t v17 = objc_alloc_init(TRISubject);
        objc_storeStrong(a1 + 3, v17);
        if PBReaderPlaceMark() && (TRISubjectReadFrom((uint64_t)v17, a2)) {
          goto LABEL_41;
        }
        goto LABEL_45;
      case 2u:
        unint64_t v17 = objc_alloc_init(TRILogTreatment);
        [a1 addTreatment:v17];
        if (!PBReaderPlaceMark() || (TRILogTreatmentReadFrom((uint64_t)v17, a2) & 1) == 0) {
          goto LABEL_45;
        }
        goto LABEL_41;
      case 3u:
        unint64_t v17 = objc_alloc_init(TRISystemDimensions);
        objc_storeStrong(a1 + 4, v17);
        if (!PBReaderPlaceMark() || (TRISystemDimensionsReadFrom(v17, a2) & 1) == 0) {
          goto LABEL_45;
        }
        goto LABEL_41;
      case 4u:
        unint64_t v17 = objc_alloc_init(TRIUserDimension);
        [a1 addUserDimension:v17];
        if (!PBReaderPlaceMark() || !TRIUserDimensionReadFrom((uint64_t)v17, a2)) {
          goto LABEL_45;
        }
        goto LABEL_41;
      case 5u:
        unint64_t v17 = objc_alloc_init(TRIMetric);
        [a1 addMetric:v17];
        if (!PBReaderPlaceMark() || (TRIMetricReadFrom((uint64_t)v17, a2) & 1) == 0) {
          goto LABEL_45;
        }
        goto LABEL_41;
      case 6u:
        unint64_t v17 = objc_alloc_init(TRITrialSystemTelemetry);
        objc_storeStrong(a1 + 6, v17);
        if (!PBReaderPlaceMark() || (TRITrialSystemTelemetryReadFrom((uint64_t)v17, a2) & 1) == 0) {
          goto LABEL_45;
        }
        goto LABEL_41;
      case 7u:
        unint64_t v17 = objc_alloc_init(TRIMLRuntimeDimensions);
        objc_storeStrong(a1 + 2, v17);
        if (PBReaderPlaceMark() && TRIMLRuntimeDimensionsReadFrom((uint64_t)v17, a2))
        {
LABEL_41:
          PBReaderRecallMark();

LABEL_42:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_45:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_42;
    }
  }
}

TRIPBFileDescriptor *TRITripushNotificationRoot_FileDescriptor()
{
  uint64_t result = (TRIPBFileDescriptor *)TRITripushNotificationRoot_FileDescriptor_descriptor;
  if (!TRITripushNotificationRoot_FileDescriptor_descriptor)
  {
    uint64_t result = [[TRIPBFileDescriptor alloc] initWithPackage:@"TRI" objcPrefix:@"TRI" syntax:2];
    TRITripushNotificationRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

uint64_t TRIPushNotification_ClearNotificationOneOfCase(void *a1)
{
  unsigned int v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "descriptor"), "oneofs"), "objectAtIndex:", 0);
  return TRIPBMaybeClearOneof((uint64_t)a1, v2, 0xFFFFFFFFLL, 0);
}

unint64_t TRINotificationProcessingPolicy_AssetDownloadPolicy_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRINotificationProcessingPolicy_AssetDownloadPolicy_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRINotificationProcessingPolicy_AssetDownloadPolicy" valueNames:"UnknownDownloadPolicy" values:&TRINotificationProcessingPolicy_AssetDownloadPolicy_EnumDescriptor_values count:3 enumVerifier:TRINotificationProcessingPolicy_AssetDownloadPolicy_IsValidValue];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRINotificationProcessingPolicy_AssetDownloadPolicy_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRINotificationProcessingPolicy_AssetDownloadPolicy_EnumDescriptor_descriptor);
}

BOOL TRINotificationProcessingPolicy_AssetDownloadPolicy_IsValidValue(unsigned int a1)
{
  return a1 < 3;
}

BOOL TRIPopulationReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  uint64_t v6 = (int *)MEMORY[0x1E4F940B8];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(unsigned char *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

BOOL TRIUserDimensionReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
LABEL_22:
        id v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose(&STACK[0x430], 8) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t TRISystemDimensionsReadFrom(_DWORD *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = 0x1E9326000uLL;
    unint64_t v8 = 0x1E9326000uLL;
    unint64_t v9 = 0x1E9326000uLL;
    unint64_t v10 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v11 = 0;
      unsigned int v12 = 0;
      unint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = *v3;
        unint64_t v15 = *(void *)(a2 + v14);
        if (v15 == -1 || v15 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)(a2 + *v10) + v15);
        *(void *)(a2 + v14) = v15 + 1;
        v13 |= (unint64_t)(v16 & 0x7F) << v11;
        if ((v16 & 0x80) == 0) {
          goto LABEL_12;
        }
        v11 += 7;
        BOOL v17 = v12++ >= 9;
        if (v17)
        {
          unint64_t v13 = 0;
          int v18 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v18 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v13 = 0;
      }
LABEL_14:
      if (v18 || (v13 & 7) == 4) {
        break;
      }
      switch((v13 >> 3))
      {
        case 1u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = *(int *)(v7 + 1408);
          goto LABEL_61;
        case 2u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          *((unsigned char *)a1 + *(int *)(v8 + 1412)) |= 0x10u;
          while (2)
          {
            uint64_t v26 = *v3;
            unint64_t v27 = *(void *)(a2 + v26);
            if (v27 == -1 || v27 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)(a2 + *v10) + v27);
              *(void *)(a2 + v26) = v27 + 1;
              v25 |= (unint64_t)(v28 & 0x7F) << v23;
              if (v28 < 0)
              {
                v23 += 7;
                BOOL v17 = v24++ >= 9;
                if (v17)
                {
                  uint64_t v25 = 0;
                  goto LABEL_72;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v25 = 0;
          }
LABEL_72:
          BOOL v58 = v25 != 0;
          uint64_t v59 = *(int *)(v9 + 1416);
          goto LABEL_89;
        case 3u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          *((unsigned char *)a1 + *(int *)(v8 + 1412)) |= 8u;
          while (2)
          {
            uint64_t v32 = *v3;
            unint64_t v33 = *(void *)(a2 + v32);
            if (v33 == -1 || v33 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v34 = *(unsigned char *)(*(void *)(a2 + *v10) + v33);
              *(void *)(a2 + v32) = v33 + 1;
              v31 |= (unint64_t)(v34 & 0x7F) << v29;
              if (v34 < 0)
              {
                v29 += 7;
                BOOL v17 = v30++ >= 9;
                if (v17)
                {
                  uint64_t v31 = 0;
                  goto LABEL_76;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v31 = 0;
          }
LABEL_76:
          BOOL v58 = v31 != 0;
          uint64_t v59 = 98;
          goto LABEL_89;
        case 4u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 88;
          goto LABEL_61;
        case 5u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 40;
          goto LABEL_61;
        case 6u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 72;
          goto LABEL_61;
        case 7u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 80;
          goto LABEL_61;
        case 8u:
          unint64_t v35 = v8;
          unint64_t v36 = v9;
          unint64_t v37 = v7;
          uint64_t v38 = PBReaderReadString();
          if (v38) {
            [a1 addUserKeyboardEnabledInputModeIdentifiers:v38];
          }

          unint64_t v7 = v37;
          unint64_t v9 = v36;
          unint64_t v8 = v35;
          continue;
        case 9u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 64;
          goto LABEL_61;
        case 0xAu:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v41 = 0;
          *((unsigned char *)a1 + *(int *)(v8 + 1412)) |= 1u;
          while (2)
          {
            uint64_t v42 = *v3;
            unint64_t v43 = *(void *)(a2 + v42);
            if (v43 == -1 || v43 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v44 = *(unsigned char *)(*(void *)(a2 + *v10) + v43);
              *(void *)(a2 + v42) = v43 + 1;
              v41 |= (unint64_t)(v44 & 0x7F) << v39;
              if (v44 < 0)
              {
                v39 += 7;
                BOOL v17 = v40++ >= 9;
                if (v17)
                {
                  LODWORD(v41) = 0;
                  goto LABEL_80;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v41) = 0;
          }
LABEL_80:
          a1[12] = v41;
          continue;
        case 0xBu:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 24;
          goto LABEL_61;
        case 0xCu:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 16;
          goto LABEL_61;
        case 0xDu:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v47 = 0;
          *((unsigned char *)a1 + *(int *)(v8 + 1412)) |= 2u;
          while (2)
          {
            uint64_t v48 = *v3;
            unint64_t v49 = *(void *)(a2 + v48);
            if (v49 == -1 || v49 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v50 = *(unsigned char *)(*(void *)(a2 + *v10) + v49);
              *(void *)(a2 + v4_Block_object_dispose(&STACK[0x430], 8) = v49 + 1;
              v47 |= (unint64_t)(v50 & 0x7F) << v45;
              if (v50 < 0)
              {
                v45 += 7;
                BOOL v17 = v46++ >= 9;
                if (v17)
                {
                  uint64_t v47 = 0;
                  goto LABEL_84;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v47 = 0;
          }
LABEL_84:
          BOOL v58 = v47 != 0;
          uint64_t v59 = 96;
          goto LABEL_89;
        case 0xEu:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 8;
LABEL_61:
          uint64_t v51 = *(void **)((char *)a1 + v21);
          *(void *)((char *)a1 + v21) = v20;

          continue;
        case 0xFu:
          char v52 = 0;
          unsigned int v53 = 0;
          uint64_t v54 = 0;
          *((unsigned char *)a1 + *(int *)(v8 + 1412)) |= 4u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v55 = *v3;
        unint64_t v56 = *(void *)(a2 + v55);
        if (v56 == -1 || v56 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v57 = *(unsigned char *)(*(void *)(a2 + *v10) + v56);
        *(void *)(a2 + v55) = v56 + 1;
        v54 |= (unint64_t)(v57 & 0x7F) << v52;
        if ((v57 & 0x80) == 0) {
          goto LABEL_86;
        }
        v52 += 7;
        BOOL v17 = v53++ >= 9;
        if (v17)
        {
          uint64_t v54 = 0;
          goto LABEL_88;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_86:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v54 = 0;
      }
LABEL_88:
      BOOL v58 = v54 != 0;
      uint64_t v59 = 97;
LABEL_89:
      *((unsigned char *)a1 + v59) = v58;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

unint64_t TRIDeploymentEnvironment_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRIDeploymentEnvironment_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRIDeploymentEnvironment" valueNames:"DeploymentEnvironmentDevice" values:&TRIDeploymentEnvironment_EnumDescriptor_values count:4 enumVerifier:TRIDeploymentEnvironment_IsValidValue];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRIDeploymentEnvironment_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRIDeploymentEnvironment_EnumDescriptor_descriptor);
}

BOOL TRIDeploymentEnvironment_IsValidValue(unsigned int a1)
{
  return a1 < 4;
}

uint64_t TRIPBWriteRawLittleEndian64(uint64_t result, uint64_t a2)
{
  uint64_t v3 = (uint64_t *)result;
  uint64_t v4 = *(void *)(result + 16);
  if (v4 == *(void *)(result + 8))
  {
    uint64_t result = TRIPBRefreshBuffer(result);
    uint64_t v4 = v3[2];
  }
  uint64_t v5 = *v3;
  v3[2] = v4 + 1;
  *(unsigned char *)(v5 + v4) = a2;
  uint64_t v6 = v3[2];
  if (v6 == v3[1])
  {
    uint64_t result = TRIPBRefreshBuffer((uint64_t)v3);
    uint64_t v6 = v3[2];
  }
  uint64_t v7 = *v3;
  v3[2] = v6 + 1;
  *(unsigned char *)(v7 + v6) = BYTE1(a2);
  uint64_t v8 = v3[2];
  if (v8 == v3[1])
  {
    uint64_t result = TRIPBRefreshBuffer((uint64_t)v3);
    uint64_t v8 = v3[2];
  }
  uint64_t v9 = *v3;
  v3[2] = v8 + 1;
  *(unsigned char *)(v9 + v_Block_object_dispose(&STACK[0x430], 8) = BYTE2(a2);
  uint64_t v10 = v3[2];
  if (v10 == v3[1])
  {
    uint64_t result = TRIPBRefreshBuffer((uint64_t)v3);
    uint64_t v10 = v3[2];
  }
  uint64_t v11 = *v3;
  v3[2] = v10 + 1;
  *(unsigned char *)(v11 + v10) = BYTE3(a2);
  uint64_t v12 = v3[2];
  if (v12 == v3[1])
  {
    uint64_t result = TRIPBRefreshBuffer((uint64_t)v3);
    uint64_t v12 = v3[2];
  }
  uint64_t v13 = *v3;
  v3[2] = v12 + 1;
  *(unsigned char *)(v13 + v12) = BYTE4(a2);
  uint64_t v14 = v3[2];
  if (v14 == v3[1])
  {
    uint64_t result = TRIPBRefreshBuffer((uint64_t)v3);
    uint64_t v14 = v3[2];
  }
  uint64_t v15 = *v3;
  v3[2] = v14 + 1;
  *(unsigned char *)(v15 + v14) = BYTE5(a2);
  uint64_t v16 = v3[2];
  if (v16 == v3[1])
  {
    uint64_t result = TRIPBRefreshBuffer((uint64_t)v3);
    uint64_t v16 = v3[2];
  }
  uint64_t v17 = *v3;
  v3[2] = v16 + 1;
  *(unsigned char *)(v17 + v16) = BYTE6(a2);
  uint64_t v18 = v3[2];
  if (v18 == v3[1])
  {
    uint64_t result = TRIPBRefreshBuffer((uint64_t)v3);
    uint64_t v18 = v3[2];
  }
  uint64_t v19 = *v3;
  v3[2] = v18 + 1;
  *(unsigned char *)(v19 + v1_Block_object_dispose(&STACK[0x430], 8) = HIBYTE(a2);
  return result;
}

uint64_t TRIPBWriteRawLittleEndian32(uint64_t result, int a2)
{
  uint64_t v3 = (uint64_t *)result;
  uint64_t v4 = *(void *)(result + 16);
  if (v4 == *(void *)(result + 8))
  {
    uint64_t result = TRIPBRefreshBuffer(result);
    uint64_t v4 = v3[2];
  }
  uint64_t v5 = *v3;
  v3[2] = v4 + 1;
  *(unsigned char *)(v5 + v4) = a2;
  uint64_t v6 = v3[2];
  if (v6 == v3[1])
  {
    uint64_t result = TRIPBRefreshBuffer((uint64_t)v3);
    uint64_t v6 = v3[2];
  }
  uint64_t v7 = *v3;
  v3[2] = v6 + 1;
  *(unsigned char *)(v7 + v6) = BYTE1(a2);
  uint64_t v8 = v3[2];
  if (v8 == v3[1])
  {
    uint64_t result = TRIPBRefreshBuffer((uint64_t)v3);
    uint64_t v8 = v3[2];
  }
  uint64_t v9 = *v3;
  v3[2] = v8 + 1;
  *(unsigned char *)(v9 + v_Block_object_dispose(&STACK[0x430], 8) = BYTE2(a2);
  uint64_t v10 = v3[2];
  if (v10 == v3[1])
  {
    uint64_t result = TRIPBRefreshBuffer((uint64_t)v3);
    uint64_t v10 = v3[2];
  }
  uint64_t v11 = *v3;
  v3[2] = v10 + 1;
  *(unsigned char *)(v11 + v10) = HIBYTE(a2);
  return result;
}

uint64_t TRIPBWriteRawVarint64(uint64_t result, unint64_t a2)
{
  unint64_t v2 = a2;
  uint64_t v3 = (uint64_t *)result;
  if (a2 >= 0x80)
  {
    do
    {
      uint64_t v5 = v3[2];
      if (v5 == v3[1])
      {
        uint64_t result = TRIPBRefreshBuffer((uint64_t)v3);
        uint64_t v5 = v3[2];
      }
      uint64_t v6 = *v3;
      v3[2] = v5 + 1;
      *(unsigned char *)(v6 + v5) = v2 | 0x80;
      unint64_t v4 = v2 >> 7;
      BOOL v7 = v2 >= 0x4000;
      v2 >>= 7;
    }
    while (v7);
  }
  else
  {
    LOBYTE(v4) = a2;
  }
  uint64_t v8 = v3[2];
  if (v8 == v3[1])
  {
    uint64_t result = TRIPBRefreshBuffer((uint64_t)v3);
    uint64_t v8 = v3[2];
  }
  uint64_t v9 = *v3;
  v3[2] = v8 + 1;
  *(unsigned char *)(v9 + v_Block_object_dispose(&STACK[0x430], 8) = v4;
  return result;
}

uint64_t TRIPBWriteInt32NoTag(uint64_t result, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0) {
    return TRIPBWriteRawVarint64(result, (int)a2);
  }
  else {
    return TRIPBWriteRawVarint32(result, a2);
  }
}

uint64_t TRIPBWriteRawVarint32(uint64_t result, unsigned int a2)
{
  unsigned int v2 = a2;
  uint64_t v3 = (uint64_t *)result;
  if (a2 >= 0x80)
  {
    do
    {
      uint64_t v5 = v3[2];
      if (v5 == v3[1])
      {
        uint64_t result = TRIPBRefreshBuffer((uint64_t)v3);
        uint64_t v5 = v3[2];
      }
      uint64_t v6 = *v3;
      v3[2] = v5 + 1;
      *(unsigned char *)(v6 + v5) = v2 | 0x80;
      unsigned int v4 = v2 >> 7;
      BOOL v7 = v2 >= 0x4000;
      v2 >>= 7;
    }
    while (v7);
  }
  else
  {
    LOBYTE(v4) = a2;
  }
  uint64_t v8 = v3[2];
  if (v8 == v3[1])
  {
    uint64_t result = TRIPBRefreshBuffer((uint64_t)v3);
    uint64_t v8 = v3[2];
  }
  uint64_t v9 = *v3;
  v3[2] = v8 + 1;
  *(unsigned char *)(v9 + v_Block_object_dispose(&STACK[0x430], 8) = v4;
  return result;
}

void sub_19361C848(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t TRIPBComputeDoubleSizeNoTag()
{
  return 8;
}

void sub_19361CA28(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t TRIPBComputeFloatSizeNoTag()
{
  return 4;
}

void sub_19361CC08(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19361CE10(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19361D018(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t TRIPBComputeInt32SizeNoTag(unsigned int a1)
{
  uint64_t v1 = 1;
  uint64_t v2 = 2;
  uint64_t v3 = 3;
  uint64_t v4 = 4;
  if (a1 >> 28) {
    uint64_t v4 = 5;
  }
  if (a1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (a1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (a1 >= 0x80) {
    uint64_t v1 = v2;
  }
  if ((a1 & 0x80000000) == 0) {
    return v1;
  }
  else {
    return 10;
  }
}

void sub_19361D27C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t TRIPBComputeUInt32SizeNoTag(unsigned int a1)
{
  uint64_t v1 = 2;
  uint64_t v2 = 3;
  uint64_t v3 = 4;
  if (a1 >> 28) {
    uint64_t v3 = 5;
  }
  if (a1 >= 0x200000) {
    uint64_t v2 = v3;
  }
  if (a1 >= 0x4000) {
    uint64_t v1 = v2;
  }
  if (a1 >= 0x80) {
    return v1;
  }
  else {
    return 1;
  }
}

void sub_19361D4C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t TRIPBComputeFixed64SizeNoTag()
{
  return 8;
}

void sub_19361D6B0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t TRIPBComputeFixed32SizeNoTag()
{
  return 4;
}

void sub_19361D898(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t TRIPBComputeSInt32SizeNoTag(int a1)
{
  unsigned int v1 = (2 * a1) ^ (a1 >> 31);
  uint64_t v2 = 2;
  uint64_t v3 = 3;
  uint64_t v4 = 4;
  if (v1 >> 28) {
    uint64_t v4 = 5;
  }
  if (v1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (v1 >= 0x80) {
    return v2;
  }
  else {
    return 1;
  }
}

void sub_19361DAF4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t TRIPBComputeSInt64SizeNoTag(uint64_t a1)
{
  return TRIPBComputeRawVarint64Size((2 * a1) ^ (a1 >> 63));
}

void sub_19361DD08(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t TRIPBComputeSFixed64SizeNoTag()
{
  return 8;
}

void sub_19361DEF0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t TRIPBComputeSFixed32SizeNoTag()
{
  return 4;
}

void sub_19361E0D8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t TRIPBComputeBoolSizeNoTag()
{
  return 1;
}

void sub_19361E2C0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t TRIPBComputeEnumSizeNoTag(unsigned int a1)
{
  uint64_t v1 = 2;
  uint64_t v2 = 3;
  uint64_t v3 = 4;
  if (a1 >> 28) {
    uint64_t v3 = 5;
  }
  if (a1 >= 0x200000) {
    uint64_t v2 = v3;
  }
  if (a1 >= 0x4000) {
    uint64_t v1 = v2;
  }
  if (a1 >= 0x80) {
    return v1;
  }
  else {
    return 1;
  }
}

uint64_t TRIPBRefreshBuffer(uint64_t result)
{
  uint64_t v1 = result;
  if (!*(void *)(result + 24)) {
    uint64_t result = [MEMORY[0x1E4F1CA00] raise:@"OutOfSpace" format:&stru_1EE43FA58];
  }
  if (*(void *)(v1 + 16))
  {
    uint64_t result = objc_msgSend(*(id *)(v1 + 24), "write:maxLength:", *(void *)v1);
    if (result != *(void *)(v1 + 16)) {
      uint64_t result = [MEMORY[0x1E4F1CA00] raise:@"WriteFailed" format:&stru_1EE43FA58];
    }
    *(void *)(v1 + 16) = 0;
  }
  return result;
}

uint64_t TRIPBComputeRawVarint64Size(unint64_t a1)
{
  if (a1 < 0x80) {
    return 1;
  }
  if (a1 < 0x4000) {
    return 2;
  }
  if (a1 < 0x200000) {
    return 3;
  }
  if (!(a1 >> 28)) {
    return 4;
  }
  if (!(a1 >> 35)) {
    return 5;
  }
  if (!(a1 >> 42)) {
    return 6;
  }
  if (!(a1 >> 49)) {
    return 7;
  }
  uint64_t v2 = 9;
  if ((a1 & 0x8000000000000000) != 0) {
    uint64_t v2 = 10;
  }
  if (HIBYTE(a1)) {
    return v2;
  }
  else {
    return 8;
  }
}

uint64_t TRIPBComputeRawVarint32Size(unsigned int a1)
{
  uint64_t v1 = 2;
  uint64_t v2 = 3;
  uint64_t v3 = 4;
  if (a1 >> 28) {
    uint64_t v3 = 5;
  }
  if (a1 >= 0x200000) {
    uint64_t v2 = v3;
  }
  if (a1 >= 0x4000) {
    uint64_t v1 = v2;
  }
  if (a1 >= 0x80) {
    return v1;
  }
  else {
    return 1;
  }
}

uint64_t TRIPBComputeSizeTSizeAsInt32NoTag(unsigned int a1)
{
  uint64_t v1 = 1;
  uint64_t v2 = 2;
  uint64_t v3 = 3;
  uint64_t v4 = 4;
  if (a1 >> 28) {
    uint64_t v4 = 5;
  }
  if (a1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (a1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (a1 >= 0x80) {
    uint64_t v1 = v2;
  }
  if ((a1 & 0x80000000) == 0) {
    return v1;
  }
  else {
    return 10;
  }
}

uint64_t TRIPBComputeStringSizeNoTag(void *a1)
{
  uint64_t v1 = [a1 lengthOfBytesUsingEncoding:4];
  uint64_t v2 = 1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if (v1 >> 28) {
    uint64_t v5 = 5;
  }
  if (v1 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v1 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x80) {
    uint64_t v2 = v3;
  }
  return v2 + v1;
}

uint64_t TRIPBComputeRawVarint32SizeForInteger(unsigned int a1)
{
  uint64_t v1 = 2;
  uint64_t v2 = 3;
  uint64_t v3 = 4;
  if (a1 >> 28) {
    uint64_t v3 = 5;
  }
  if (a1 >= 0x200000) {
    uint64_t v2 = v3;
  }
  if (a1 >= 0x4000) {
    uint64_t v1 = v2;
  }
  if (a1 >= 0x80) {
    return v1;
  }
  else {
    return 1;
  }
}

uint64_t TRIPBComputeMessageSizeNoTag(void *a1)
{
  uint64_t v1 = [a1 serializedSize];
  uint64_t v2 = 1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if (v1 >> 28) {
    uint64_t v5 = 5;
  }
  if (v1 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v1 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x80) {
    uint64_t v2 = v3;
  }
  return v2 + v1;
}

uint64_t TRIPBComputeBytesSizeNoTag(void *a1)
{
  uint64_t v1 = [a1 length];
  uint64_t v2 = 1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if (v1 >> 28) {
    uint64_t v5 = 5;
  }
  if (v1 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v1 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x80) {
    uint64_t v2 = v3;
  }
  return v2 + v1;
}

uint64_t TRIPBComputeDoubleSize(int a1)
{
  unsigned int v1 = 8 * a1;
  uint64_t v2 = 10;
  uint64_t v3 = 11;
  uint64_t v4 = 12;
  if ((8 * a1) >> 28) {
    uint64_t v4 = 13;
  }
  if (v1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (v1 >= 0x80) {
    return v2;
  }
  else {
    return 9;
  }
}

uint64_t TRIPBComputeTagSize(int a1)
{
  unsigned int v1 = 8 * a1;
  uint64_t v2 = 2;
  uint64_t v3 = 3;
  uint64_t v4 = 4;
  if ((8 * a1) >> 28) {
    uint64_t v4 = 5;
  }
  if (v1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (v1 >= 0x80) {
    return v2;
  }
  else {
    return 1;
  }
}

uint64_t TRIPBComputeFloatSize(int a1)
{
  unsigned int v1 = 8 * a1;
  uint64_t v2 = 6;
  uint64_t v3 = 7;
  uint64_t v4 = 8;
  if ((8 * a1) >> 28) {
    uint64_t v4 = 9;
  }
  if (v1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (v1 >= 0x80) {
    return v2;
  }
  else {
    return 5;
  }
}

uint64_t TRIPBComputeUInt64Size(int a1, unint64_t a2)
{
  unsigned int v2 = 8 * a1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if ((8 * a1) >> 28) {
    uint64_t v5 = 5;
  }
  if (v2 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v2 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v2 >= 0x80) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 1;
  }
  return TRIPBComputeRawVarint64Size(a2) + v6;
}

uint64_t TRIPBComputeInt64Size(int a1, unint64_t a2)
{
  unsigned int v2 = 8 * a1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if ((8 * a1) >> 28) {
    uint64_t v5 = 5;
  }
  if (v2 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v2 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v2 >= 0x80) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 1;
  }
  return TRIPBComputeRawVarint64Size(a2) + v6;
}

uint64_t TRIPBComputeInt32Size(int a1, unsigned int a2)
{
  unsigned int v2 = 8 * a1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if ((8 * a1) >> 28) {
    uint64_t v5 = 5;
  }
  if (v2 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v2 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v2 >= 0x80) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 1;
  }
  uint64_t v7 = 10;
  uint64_t v8 = 1;
  uint64_t v9 = 2;
  uint64_t v10 = 3;
  uint64_t v11 = 4;
  if (a2 >> 28) {
    uint64_t v11 = 5;
  }
  if (a2 >= 0x200000) {
    uint64_t v10 = v11;
  }
  if (a2 >= 0x4000) {
    uint64_t v9 = v10;
  }
  if (a2 >= 0x80) {
    uint64_t v8 = v9;
  }
  if ((a2 & 0x80000000) == 0) {
    uint64_t v7 = v8;
  }
  return v7 + v6;
}

uint64_t TRIPBComputeFixed64Size(int a1)
{
  unsigned int v1 = 8 * a1;
  uint64_t v2 = 10;
  uint64_t v3 = 11;
  uint64_t v4 = 12;
  if ((8 * a1) >> 28) {
    uint64_t v4 = 13;
  }
  if (v1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (v1 >= 0x80) {
    return v2;
  }
  else {
    return 9;
  }
}

uint64_t TRIPBComputeFixed32Size(int a1)
{
  unsigned int v1 = 8 * a1;
  uint64_t v2 = 6;
  uint64_t v3 = 7;
  uint64_t v4 = 8;
  if ((8 * a1) >> 28) {
    uint64_t v4 = 9;
  }
  if (v1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (v1 >= 0x80) {
    return v2;
  }
  else {
    return 5;
  }
}

uint64_t TRIPBComputeBoolSize(int a1)
{
  unsigned int v1 = 8 * a1;
  uint64_t v2 = 3;
  uint64_t v3 = 4;
  uint64_t v4 = 5;
  if ((8 * a1) >> 28) {
    uint64_t v4 = 6;
  }
  if (v1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (v1 >= 0x80) {
    return v2;
  }
  else {
    return 2;
  }
}

uint64_t TRIPBComputeStringSize(int a1, void *a2)
{
  unsigned int v2 = 8 * a1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if ((8 * a1) >> 28) {
    uint64_t v5 = 5;
  }
  if (v2 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v2 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v2 >= 0x80) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 1;
  }
  uint64_t v7 = [a2 lengthOfBytesUsingEncoding:4];
  uint64_t v8 = 1;
  uint64_t v9 = 2;
  uint64_t v10 = 3;
  uint64_t v11 = 4;
  if (v7 >> 28) {
    uint64_t v11 = 5;
  }
  if (v7 >= 0x200000) {
    uint64_t v10 = v11;
  }
  if (v7 >= 0x4000) {
    uint64_t v9 = v10;
  }
  if (v7 >= 0x80) {
    uint64_t v8 = v9;
  }
  return v7 + v6 + v8;
}

uint64_t TRIPBComputeGroupSize(int a1, void *a2)
{
  unsigned int v2 = 8 * a1;
  uint64_t v3 = 4;
  uint64_t v4 = 6;
  uint64_t v5 = 10;
  if (!((8 * a1) >> 28)) {
    uint64_t v5 = 8;
  }
  if (v2 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v2 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v2 >= 0x80) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 2;
  }
  return [a2 serializedSize] + v6;
}

uint64_t TRIPBComputeUnknownGroupSize(int a1, void *a2)
{
  unsigned int v2 = 8 * a1;
  uint64_t v3 = 4;
  uint64_t v4 = 6;
  uint64_t v5 = 10;
  if (!((8 * a1) >> 28)) {
    uint64_t v5 = 8;
  }
  if (v2 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v2 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v2 >= 0x80) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 2;
  }
  return [a2 serializedSize] + v6;
}

uint64_t TRIPBComputeMessageSize(int a1, void *a2)
{
  unsigned int v2 = 8 * a1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if ((8 * a1) >> 28) {
    uint64_t v5 = 5;
  }
  if (v2 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v2 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v2 >= 0x80) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 1;
  }
  uint64_t v7 = [a2 serializedSize];
  uint64_t v8 = 1;
  uint64_t v9 = 2;
  uint64_t v10 = 3;
  uint64_t v11 = 4;
  if (v7 >> 28) {
    uint64_t v11 = 5;
  }
  if (v7 >= 0x200000) {
    uint64_t v10 = v11;
  }
  if (v7 >= 0x4000) {
    uint64_t v9 = v10;
  }
  if (v7 >= 0x80) {
    uint64_t v8 = v9;
  }
  return v7 + v6 + v8;
}

uint64_t TRIPBComputeBytesSize(int a1, void *a2)
{
  unsigned int v2 = 8 * a1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if ((8 * a1) >> 28) {
    uint64_t v5 = 5;
  }
  if (v2 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v2 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v2 >= 0x80) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 1;
  }
  uint64_t v7 = [a2 length];
  uint64_t v8 = 1;
  uint64_t v9 = 2;
  uint64_t v10 = 3;
  uint64_t v11 = 4;
  if (v7 >> 28) {
    uint64_t v11 = 5;
  }
  if (v7 >= 0x200000) {
    uint64_t v10 = v11;
  }
  if (v7 >= 0x4000) {
    uint64_t v9 = v10;
  }
  if (v7 >= 0x80) {
    uint64_t v8 = v9;
  }
  return v7 + v6 + v8;
}

uint64_t TRIPBComputeUInt32Size(int a1, unsigned int a2)
{
  unsigned int v2 = 8 * a1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if ((8 * a1) >> 28) {
    uint64_t v5 = 5;
  }
  if (v2 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v2 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v2 >= 0x80) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 1;
  }
  uint64_t v7 = 1;
  uint64_t v8 = 2;
  uint64_t v9 = 3;
  uint64_t v10 = 4;
  if (a2 >> 28) {
    uint64_t v10 = 5;
  }
  if (a2 >= 0x200000) {
    uint64_t v9 = v10;
  }
  if (a2 >= 0x4000) {
    uint64_t v8 = v9;
  }
  if (a2 >= 0x80) {
    uint64_t v7 = v8;
  }
  return v7 + v6;
}

uint64_t TRIPBComputeEnumSize(int a1, unsigned int a2)
{
  unsigned int v2 = 8 * a1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if ((8 * a1) >> 28) {
    uint64_t v5 = 5;
  }
  if (v2 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v2 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v2 >= 0x80) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 1;
  }
  uint64_t v7 = 1;
  uint64_t v8 = 2;
  uint64_t v9 = 3;
  uint64_t v10 = 4;
  if (a2 >> 28) {
    uint64_t v10 = 5;
  }
  if (a2 >= 0x200000) {
    uint64_t v9 = v10;
  }
  if (a2 >= 0x4000) {
    uint64_t v8 = v9;
  }
  if (a2 >= 0x80) {
    uint64_t v7 = v8;
  }
  return v7 + v6;
}

uint64_t TRIPBComputeSFixed32Size(int a1)
{
  unsigned int v1 = 8 * a1;
  uint64_t v2 = 6;
  uint64_t v3 = 7;
  uint64_t v4 = 8;
  if ((8 * a1) >> 28) {
    uint64_t v4 = 9;
  }
  if (v1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (v1 >= 0x80) {
    return v2;
  }
  else {
    return 5;
  }
}

uint64_t TRIPBComputeSFixed64Size(int a1)
{
  unsigned int v1 = 8 * a1;
  uint64_t v2 = 10;
  uint64_t v3 = 11;
  uint64_t v4 = 12;
  if ((8 * a1) >> 28) {
    uint64_t v4 = 13;
  }
  if (v1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (v1 >= 0x80) {
    return v2;
  }
  else {
    return 9;
  }
}

uint64_t TRIPBComputeSInt32Size(int a1, int a2)
{
  unsigned int v2 = 8 * a1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if ((8 * a1) >> 28) {
    uint64_t v5 = 5;
  }
  if (v2 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v2 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v2 >= 0x80) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 1;
  }
  unsigned int v7 = (2 * a2) ^ (a2 >> 31);
  uint64_t v8 = 2;
  uint64_t v9 = 3;
  uint64_t v10 = 4;
  if (v7 >> 28) {
    uint64_t v10 = 5;
  }
  if (v7 >= 0x200000) {
    uint64_t v9 = v10;
  }
  if (v7 >= 0x4000) {
    uint64_t v8 = v9;
  }
  if (v7 >= 0x80) {
    uint64_t v11 = v8;
  }
  else {
    uint64_t v11 = 1;
  }
  return v11 + v6;
}

uint64_t TRIPBComputeSInt64Size(int a1, uint64_t a2)
{
  unsigned int v2 = 8 * a1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if ((8 * a1) >> 28) {
    uint64_t v5 = 5;
  }
  if (v2 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v2 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v2 >= 0x80) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 1;
  }
  return TRIPBComputeRawVarint64Size((2 * a2) ^ (a2 >> 63)) + v6;
}

uint64_t TRIPBComputeMessageSetExtensionSize(unsigned int a1, void *a2)
{
  uint64_t v2 = 6;
  uint64_t v3 = 7;
  uint64_t v4 = 8;
  if (a1 >> 28) {
    uint64_t v4 = 9;
  }
  if (a1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (a1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (a1 >= 0x80) {
    uint64_t v5 = v2;
  }
  else {
    uint64_t v5 = 5;
  }
  uint64_t v6 = [a2 serializedSize];
  uint64_t v7 = 1;
  uint64_t v8 = 2;
  uint64_t v9 = 3;
  uint64_t v10 = 4;
  if (v6 >> 28) {
    uint64_t v10 = 5;
  }
  if (v6 >= 0x200000) {
    uint64_t v9 = v10;
  }
  if (v6 >= 0x4000) {
    uint64_t v8 = v9;
  }
  if (v6 >= 0x80) {
    uint64_t v7 = v8;
  }
  return v5 + v6 + v7;
}

uint64_t TRIPBComputeRawMessageSetExtensionSize(unsigned int a1, void *a2)
{
  uint64_t v2 = 6;
  uint64_t v3 = 7;
  uint64_t v4 = 8;
  if (a1 >> 28) {
    uint64_t v4 = 9;
  }
  if (a1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (a1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (a1 >= 0x80) {
    uint64_t v5 = v2;
  }
  else {
    uint64_t v5 = 5;
  }
  uint64_t v6 = [a2 length];
  uint64_t v7 = 1;
  uint64_t v8 = 2;
  uint64_t v9 = 3;
  uint64_t v10 = 4;
  if (v6 >> 28) {
    uint64_t v10 = 5;
  }
  if (v6 >= 0x200000) {
    uint64_t v9 = v10;
  }
  if (v6 >= 0x4000) {
    uint64_t v8 = v9;
  }
  if (v6 >= 0x80) {
    uint64_t v7 = v8;
  }
  return v5 + v6 + v7;
}

uint64_t TRIPBComputeWireFormatTagSize(int a1, int a2)
{
  unsigned int v2 = 8 * a1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if ((8 * a1) >> 28) {
    uint64_t v5 = 5;
  }
  if (v2 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v2 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v2 >= 0x80) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 1;
  }
  return v6 << (a2 == 16);
}

BOOL TRITrialFactorFieldsReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose(&STACK[0x430], 8) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t TRIPBWireFormatMakeTag(int a1, int a2)
{
  return a2 | (8 * a1);
}

uint64_t TRIPBWireFormatGetTagWireType(char a1)
{
  return a1 & 7;
}

uint64_t TRIPBWireFormatGetTagFieldNumber(unsigned int a1)
{
  return a1 >> 3;
}

BOOL TRIPBWireFormatIsValidTag(int a1)
{
  return (~a1 & 6) != 0;
}

uint64_t TRIPBWireFormatForType(int a1, char a2)
{
  if (a2) {
    return 2;
  }
  else {
    return TRIPBWireFormatForType_format[a1];
  }
}

TRIPBFileDescriptor *TRITriassignmentRoot_FileDescriptor()
{
  uint64_t result = (TRIPBFileDescriptor *)TRITriassignmentRoot_FileDescriptor_descriptor;
  if (!TRITriassignmentRoot_FileDescriptor_descriptor)
  {
    uint64_t result = [[TRIPBFileDescriptor alloc] initWithPackage:@"TRI" objcPrefix:@"TRI" syntax:2];
    TRITriassignmentRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

uint64_t TRIAssignment_ClearLanguageOneOfCase(void *a1)
{
  unsigned int v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "descriptor"), "oneofs"), "objectAtIndex:", 0);
  return TRIPBMaybeClearOneof((uint64_t)a1, v2, 0xFFFFFFFFLL, 0);
}

unint64_t TRIPBSyntax_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRIPBSyntax_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRIPBSyntax" valueNames:"SyntaxProto2" values:&TRIPBSyntax_EnumDescriptor_values count:2 enumVerifier:TRIPBSyntax_IsValidValue];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRIPBSyntax_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRIPBSyntax_EnumDescriptor_descriptor);
}

BOOL TRIPBSyntax_IsValidValue(unsigned int a1)
{
  return a1 < 2;
}

TRIPBFileDescriptor *TRIPBTypeRoot_FileDescriptor()
{
  uint64_t result = (TRIPBFileDescriptor *)TRIPBTypeRoot_FileDescriptor_descriptor;
  if (!TRIPBTypeRoot_FileDescriptor_descriptor)
  {
    uint64_t result = [[TRIPBFileDescriptor alloc] initWithPackage:@"google.protobuf" objcPrefix:@"TRIPB" syntax:3];
    TRIPBTypeRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

uint64_t TRIPBType_Syntax_RawValue(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(+[TRIPBType descriptor](TRIPBType, "descriptor"), "fieldWithNumber:", 6);
  return TRIPBGetMessageInt32Field(a1, v2);
}

void *SetTRIPBType_Syntax_RawValue(void *a1, int a2)
{
  id v4 = +[TRIPBType descriptor];
  uint64_t v5 = [v4 fieldWithNumber:6];
  int v6 = objc_msgSend((id)objc_msgSend(v4, "file"), "syntax");
  return TRIPBSetInt32IvarWithFieldInternal(a1, v5, a2, v6);
}

unint64_t TRIPBField_Kind_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRIPBField_Kind_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRIPBField_Kind" valueNames:"TypeUnknown" values:&TRIPBField_Kind_EnumDescriptor_values count:19 enumVerifier:TRIPBField_Kind_IsValidValue];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRIPBField_Kind_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRIPBField_Kind_EnumDescriptor_descriptor);
}

unint64_t TRIPBField_Cardinality_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRIPBField_Cardinality_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRIPBField_Cardinality" valueNames:"CardinalityUnknown" values:&TRIPBField_Cardinality_EnumDescriptor_values count:4 enumVerifier:TRIPBField_Cardinality_IsValidValue];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRIPBField_Cardinality_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRIPBField_Cardinality_EnumDescriptor_descriptor);
}

uint64_t TRIPBField_Kind_RawValue(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(+[TRIPBField descriptor](TRIPBField, "descriptor"), "fieldWithNumber:", 1);
  return TRIPBGetMessageInt32Field(a1, v2);
}

void *SetTRIPBField_Kind_RawValue(void *a1, int a2)
{
  id v4 = +[TRIPBField descriptor];
  uint64_t v5 = [v4 fieldWithNumber:1];
  int v6 = objc_msgSend((id)objc_msgSend(v4, "file"), "syntax");
  return TRIPBSetInt32IvarWithFieldInternal(a1, v5, a2, v6);
}

uint64_t TRIPBField_Cardinality_RawValue(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(+[TRIPBField descriptor](TRIPBField, "descriptor"), "fieldWithNumber:", 2);
  return TRIPBGetMessageInt32Field(a1, v2);
}

void *SetTRIPBField_Cardinality_RawValue(void *a1, int a2)
{
  id v4 = +[TRIPBField descriptor];
  uint64_t v5 = [v4 fieldWithNumber:2];
  int v6 = objc_msgSend((id)objc_msgSend(v4, "file"), "syntax");
  return TRIPBSetInt32IvarWithFieldInternal(a1, v5, a2, v6);
}

BOOL TRIPBField_Kind_IsValidValue(unsigned int a1)
{
  return a1 < 0x13;
}

BOOL TRIPBField_Cardinality_IsValidValue(unsigned int a1)
{
  return a1 < 4;
}

uint64_t TRIPBEnum_Syntax_RawValue(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(+[TRIPBEnum descriptor](TRIPBEnum, "descriptor"), "fieldWithNumber:", 5);
  return TRIPBGetMessageInt32Field(a1, v2);
}

void *SetTRIPBEnum_Syntax_RawValue(void *a1, int a2)
{
  id v4 = +[TRIPBEnum descriptor];
  uint64_t v5 = [v4 fieldWithNumber:5];
  int v6 = objc_msgSend((id)objc_msgSend(v4, "file"), "syntax");
  return TRIPBSetInt32IvarWithFieldInternal(a1, v5, a2, v6);
}

TRIPBFileDescriptor *TRIPBDescriptorRoot_FileDescriptor()
{
  uint64_t result = (TRIPBFileDescriptor *)TRIPBDescriptorRoot_FileDescriptor_descriptor;
  if (!TRIPBDescriptorRoot_FileDescriptor_descriptor)
  {
    uint64_t result = [[TRIPBFileDescriptor alloc] initWithPackage:@"google.protobuf" objcPrefix:@"TRIPB" syntax:2];
    TRIPBDescriptorRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

unint64_t TRIPBFieldDescriptorProto_Label_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRIPBFieldDescriptorProto_Label_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRIPBFieldDescriptorProto_Label" valueNames:"LabelOptional" values:&TRIPBFieldDescriptorProto_Label_EnumDescriptor_values count:3 enumVerifier:TRIPBFieldDescriptorProto_Label_IsValidValue];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRIPBFieldDescriptorProto_Label_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRIPBFieldDescriptorProto_Label_EnumDescriptor_descriptor);
}

unint64_t TRIPBFieldDescriptorProto_Type_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRIPBFieldDescriptorProto_Type_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRIPBFieldDescriptorProto_Type" valueNames:"TypeDouble" values:&TRIPBFieldDescriptorProto_Type_EnumDescriptor_values count:18 enumVerifier:TRIPBFieldDescriptorProto_Type_IsValidValue];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRIPBFieldDescriptorProto_Type_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRIPBFieldDescriptorProto_Type_EnumDescriptor_descriptor);
}

BOOL TRIPBFieldDescriptorProto_Type_IsValidValue(int a1)
{
  return (a1 - 1) < 0x12;
}

BOOL TRIPBFieldDescriptorProto_Label_IsValidValue(int a1)
{
  return (a1 - 1) < 3;
}

unint64_t TRIPBFileOptions_OptimizeMode_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRIPBFileOptions_OptimizeMode_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRIPBFileOptions_OptimizeMode" valueNames:"Speed" values:&TRIPBFileOptions_OptimizeMode_EnumDescriptor_values count:3 enumVerifier:TRIPBFileOptions_OptimizeMode_IsValidValue];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRIPBFileOptions_OptimizeMode_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRIPBFileOptions_OptimizeMode_EnumDescriptor_descriptor);
}

BOOL TRIPBFileOptions_OptimizeMode_IsValidValue(int a1)
{
  return (a1 - 1) < 3;
}

unint64_t TRIPBFieldOptions_CType_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRIPBFieldOptions_CType_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRIPBFieldOptions_CType" valueNames:"String" values:&TRIPBFieldOptions_CType_EnumDescriptor_values count:3 enumVerifier:TRIPBFieldOptions_CType_IsValidValue];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRIPBFieldOptions_CType_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRIPBFieldOptions_CType_EnumDescriptor_descriptor);
}

unint64_t TRIPBFieldOptions_JSType_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRIPBFieldOptions_JSType_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRIPBFieldOptions_JSType" valueNames:"JsNormal" values:&TRIPBFieldOptions_JSType_EnumDescriptor_values count:3 enumVerifier:TRIPBFieldOptions_JSType_IsValidValue];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRIPBFieldOptions_JSType_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRIPBFieldOptions_JSType_EnumDescriptor_descriptor);
}

BOOL TRIPBFieldOptions_CType_IsValidValue(unsigned int a1)
{
  return a1 < 3;
}

BOOL TRIPBFieldOptions_JSType_IsValidValue(unsigned int a1)
{
  return a1 < 3;
}

unint64_t TRIPBMethodOptions_IdempotencyLevel_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRIPBMethodOptions_IdempotencyLevel_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRIPBMethodOptions_IdempotencyLevel" valueNames:"IdempotencyUnknown" values:&TRIPBMethodOptions_IdempotencyLevel_EnumDescriptor_values count:3 enumVerifier:TRIPBMethodOptions_IdempotencyLevel_IsValidValue];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRIPBMethodOptions_IdempotencyLevel_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRIPBMethodOptions_IdempotencyLevel_EnumDescriptor_descriptor);
}

BOOL TRIPBMethodOptions_IdempotencyLevel_IsValidValue(unsigned int a1)
{
  return a1 < 3;
}

unint64_t TRIPBNullValue_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRIPBNullValue_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRIPBNullValue" valueNames:"NullValue" values:&TRIPBNullValue_EnumDescriptor_values count:1 enumVerifier:TRIPBNullValue_IsValidValue];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRIPBNullValue_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRIPBNullValue_EnumDescriptor_descriptor);
}

BOOL TRIPBNullValue_IsValidValue(int a1)
{
  return a1 == 0;
}

TRIPBFileDescriptor *TRIPBStructRoot_FileDescriptor()
{
  uint64_t result = (TRIPBFileDescriptor *)TRIPBStructRoot_FileDescriptor_descriptor;
  if (!TRIPBStructRoot_FileDescriptor_descriptor)
  {
    uint64_t result = [[TRIPBFileDescriptor alloc] initWithPackage:@"google.protobuf" objcPrefix:@"TRIPB" syntax:3];
    TRIPBStructRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

uint64_t TRIPBValue_NullValue_RawValue(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(+[TRIPBValue descriptor](TRIPBValue, "descriptor"), "fieldWithNumber:", 1);
  return TRIPBGetMessageInt32Field(a1, v2);
}

void *SetTRIPBValue_NullValue_RawValue(void *a1, int a2)
{
  id v4 = +[TRIPBValue descriptor];
  uint64_t v5 = [v4 fieldWithNumber:1];
  int v6 = objc_msgSend((id)objc_msgSend(v4, "file"), "syntax");
  return TRIPBSetInt32IvarWithFieldInternal(a1, v5, a2, v6);
}

uint64_t TRIPBValue_ClearKindOneOfCase(void *a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "descriptor"), "oneofs"), "objectAtIndex:", 0);
  return TRIPBMaybeClearOneof((uint64_t)a1, v2, 0xFFFFFFFFLL, 0);
}

unint64_t TRIAllocationUnitType_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRIAllocationUnitType_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRIAllocationUnitType" valueNames:"Default" values:&TRIAllocationUnitType_EnumDescriptor_values count:4 enumVerifier:TRIAllocationUnitType_IsValidValue];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRIAllocationUnitType_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRIAllocationUnitType_EnumDescriptor_descriptor);
}

BOOL TRIAllocationUnitType_IsValidValue(unsigned int a1)
{
  return a1 < 4;
}

TRIPBFileDescriptor *TRIUiassignmentRoot_FileDescriptor()
{
  uint64_t result = (TRIPBFileDescriptor *)TRIUiassignmentRoot_FileDescriptor_descriptor;
  if (!TRIUiassignmentRoot_FileDescriptor_descriptor)
  {
    uint64_t result = [[TRIPBFileDescriptor alloc] initWithPackage:@"TRI" objcPrefix:@"TRI" syntax:2];
    TRIUiassignmentRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

unint64_t TRIPredicate_SystemVariable_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRIPredicate_SystemVariable_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRIPredicate_SystemVariable" valueNames:&unk_193630800 values:&TRIPredicate_SystemVariable_EnumDescriptor_values count:18 enumVerifier:TRIPredicate_SystemVariable_IsValidValue];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRIPredicate_SystemVariable_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRIPredicate_SystemVariable_EnumDescriptor_descriptor);
}

unint64_t TRIPredicate_Operation_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRIPredicate_Operation_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRIPredicate_Operation" valueNames:"Equals" values:&TRIPredicate_Operation_EnumDescriptor_values count:15 enumVerifier:TRIPredicate_Operation_IsValidValue];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRIPredicate_Operation_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRIPredicate_Operation_EnumDescriptor_descriptor);
}

uint64_t TRIPredicate_ClearTargetingKeyOneOfCase(void *a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "descriptor"), "oneofs"), "objectAtIndex:", 0);
  return TRIPBMaybeClearOneof((uint64_t)a1, v2, 0xFFFFFFFFLL, 0);
}

uint64_t TRIPredicate_SystemVariable_IsValidValue(unsigned int a1)
{
  return (a1 < 0x13) & (0x7FFBFu >> a1);
}

BOOL TRIPredicate_Operation_IsValidValue(unsigned int a1)
{
  return a1 < 0xF;
}

unint64_t TRICovariate_TYPE_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRICovariate_TYPE_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRICovariate_TYPE" valueNames:"String" values:&TRICovariate_TYPE_EnumDescriptor_values count:5 enumVerifier:TRICovariate_TYPE_IsValidValue];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRICovariate_TYPE_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRICovariate_TYPE_EnumDescriptor_descriptor);
}

BOOL TRICovariate_TYPE_IsValidValue(unsigned int a1)
{
  return a1 < 5;
}

uint64_t TRIUIAssignment_ClearBucketingOneOfCase(void *a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "descriptor"), "oneofs"), "objectAtIndex:", 0);
  return TRIPBMaybeClearOneof((uint64_t)a1, v2, 0xFFFFFFFFLL, 0);
}

unint64_t TRICustomPredicate_KeyType_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRICustomPredicate_KeyType_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRICustomPredicate_KeyType" valueNames:"String" values:&TRICustomPredicate_KeyType_EnumDescriptor_values count:4 enumVerifier:TRICustomPredicate_KeyType_IsValidValue];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRICustomPredicate_KeyType_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRICustomPredicate_KeyType_EnumDescriptor_descriptor);
}

BOOL TRICustomPredicate_KeyType_IsValidValue(int a1)
{
  return (a1 - 1) < 4;
}

unint64_t TRIGroupedPredicate_LogicalOperator_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRIGroupedPredicate_LogicalOperator_EnumDescriptor_descriptor))
  {
    id v1 = +[TRIPBEnumDescriptor allocDescriptorForName:@"TRIGroupedPredicate_LogicalOperator" valueNames:&unk_193630AE0 values:&TRIGroupedPredicate_LogicalOperator_EnumDescriptor_values count:2 enumVerifier:TRIGroupedPredicate_LogicalOperator_IsValidValue];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRIGroupedPredicate_LogicalOperator_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRIGroupedPredicate_LogicalOperator_EnumDescriptor_descriptor);
}

BOOL TRIGroupedPredicate_LogicalOperator_IsValidValue(int a1)
{
  return (a1 - 1) < 2;
}

TRIPBFileDescriptor *TRIPBApiRoot_FileDescriptor()
{
  uint64_t result = (TRIPBFileDescriptor *)TRIPBApiRoot_FileDescriptor_descriptor;
  if (!TRIPBApiRoot_FileDescriptor_descriptor)
  {
    uint64_t result = [[TRIPBFileDescriptor alloc] initWithPackage:@"google.protobuf" objcPrefix:@"TRIPB" syntax:3];
    TRIPBApiRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

uint64_t TRIPBApi_Syntax_RawValue(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(+[TRIPBApi descriptor](TRIPBApi, "descriptor"), "fieldWithNumber:", 7);
  return TRIPBGetMessageInt32Field(a1, v2);
}

void *SetTRIPBApi_Syntax_RawValue(void *a1, int a2)
{
  id v4 = +[TRIPBApi descriptor];
  uint64_t v5 = [v4 fieldWithNumber:7];
  int v6 = objc_msgSend((id)objc_msgSend(v4, "file"), "syntax");
  return TRIPBSetInt32IvarWithFieldInternal(a1, v5, a2, v6);
}

uint64_t TRIPBMethod_Syntax_RawValue(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(+[TRIPBMethod descriptor](TRIPBMethod, "descriptor"), "fieldWithNumber:", 7);
  return TRIPBGetMessageInt32Field(a1, v2);
}

void *SetTRIPBMethod_Syntax_RawValue(void *a1, int a2)
{
  id v4 = +[TRIPBMethod descriptor];
  uint64_t v5 = [v4 fieldWithNumber:7];
  int v6 = objc_msgSend((id)objc_msgSend(v4, "file"), "syntax");
  return TRIPBSetInt32IvarWithFieldInternal(a1, v5, a2, v6);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

id NSAllocateObject(Class aClass, NSUInteger extraBytes, NSZone *zone)
{
  return (id)MEMORY[0x1F40E6FF0](aClass, extraBytes, zone);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSZone *__cdecl NSZoneFromPointer(void *ptr)
{
  return (NSZone *)MEMORY[0x1F40E7308](ptr);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1F4147190]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1F41471C0]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1F41471F0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1F4147240]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1F4147248]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

uint64_t PBRepeatedUInt32Add()
{
  return MEMORY[0x1F41473D0]();
}

uint64_t PBRepeatedUInt32Clear()
{
  return MEMORY[0x1F41473D8]();
}

uint64_t PBRepeatedUInt32Copy()
{
  return MEMORY[0x1F41473E0]();
}

uint64_t PBRepeatedUInt32Hash()
{
  return MEMORY[0x1F41473E8]();
}

uint64_t PBRepeatedUInt32IsEqual()
{
  return MEMORY[0x1F41473F0]();
}

uint64_t PBRepeatedUInt32NSArray()
{
  return MEMORY[0x1F41473F8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9D00](*(void *)&a1);
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1F41814C8](cls, name, imp, types);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x1F41814F8](cls, outCount);
}

size_t class_getInstanceSize(Class cls)
{
  return MEMORY[0x1F4181530](cls);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1F4181548](cls);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_release(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

IMP imp_implementationWithBlock(id block)
{
  return (IMP)MEMORY[0x1F4181598](block);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x1F4181600](m);
}

long double modf(long double __x, long double *__y)
{
  MEMORY[0x1F40CCE48](__y, __x);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

Class objc_getMetaClass(const char *name)
{
  return (Class)MEMORY[0x1F4181740](name);
}

Protocol *__cdecl objc_getProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x1F4181750](name);
}

Class objc_lookUpClass(const char *name)
{
  return (Class)MEMORY[0x1F4181788](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  id v4 = (const char *)MEMORY[0x1F4181B08](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1F40CDC88](__ptr, __size);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

SEL sel_getUid(const char *str)
{
  return (SEL)MEMORY[0x1F4181B30](str);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}