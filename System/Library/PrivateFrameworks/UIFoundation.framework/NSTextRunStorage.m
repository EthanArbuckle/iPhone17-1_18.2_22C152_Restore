@interface NSTextRunStorage
@end

@implementation NSTextRunStorage

NSCountableTextLocation *__69___NSTextRunStorage_enumerateObjectsFromLocation_options_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = -[_NSTextRunStorage _indexFromTextLocation:](a2, *(void **)(a1 + 32));
  unint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 16) count];
  unint64_t v6 = v5;
  char v14 = 0;
  if (*(unsigned char *)(a1 + 64))
  {
    if (v4 >= v5) {
      unint64_t v7 = v5;
    }
    else {
      unint64_t v7 = v4;
    }
    if (*(void *)(a1 + 32)) {
      unint64_t v8 = v7;
    }
    else {
      unint64_t v8 = v5;
    }
    unint64_t v4 = v8 - 1;
  }
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  if (v4 < v5)
  {
    do
    {
      uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 16) objectAtIndex:v4 effectiveRange:&v15];
      if (v9 && v9 != [MEMORY[0x1E4F1CA98] null])
      {
        if (*(unsigned char *)(a1 + 65)) {
          v10 = 0;
        }
        else {
          v10 = (void *)[(_NSTextRunStorage *)a2 _createTextRangeFromRange:v16];
        }
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
      if (*(unsigned char *)(a1 + 64)) {
        uint64_t v11 = -1;
      }
      else {
        uint64_t v11 = v16;
      }
      unint64_t v4 = v11 + v15;
      if (v14) {
        BOOL v12 = 1;
      }
      else {
        BOOL v12 = v4 >= v6;
      }
    }
    while (!v12);
  }
  if (v4 >= v6) {
    result = 0;
  }
  else {
    result = -[_NSTextRunStorage _createLocationFromOffset:](a2, v4);
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
  return result;
}

uint64_t __28___NSTextRunStorage_isEmpty__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  *a4 = 1;
  return result;
}

NSUInteger __53___NSTextRunStorage_invalidateElementsInRange_delta___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSUInteger v3 = -[_NSTextRunStorage _rangeFromTextRange:](a2, *(void **)(a1 + 32));
  NSUInteger v5 = v4;
  NSUInteger v6 = [*(id *)(*(void *)(a1 + 40) + 16) count];
  uint64_t v7 = *(void *)(a1 + 48);
  v13.location = v3;
  v13.length = v5;
  v14.location = 0;
  v14.length = v6;
  NSRange v9 = NSIntersectionRange(v13, v14);
  NSUInteger result = v9.location;
  if (v3 + v5 >= v6) {
    uint64_t v10 = v7 & (v7 >> 63);
  }
  else {
    uint64_t v10 = v7;
  }
  if (v9.length) {
    NSUInteger result = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "deleteObjectsInRange:", v9.location, v9.length);
  }
  if ((int64_t)(v9.length + v10) >= 1)
  {
    uint64_t v11 = *(void **)(*(void *)(a1 + 40) + 16);
    return [v11 insertObject:0 range:v9.location];
  }
  return result;
}

NSUInteger __40___NSTextRunStorage_setObject_forRange___block_invoke(uint64_t a1, uint64_t a2)
{
  NSUInteger v3 = -[_NSTextRunStorage _rangeFromTextRange:](a2, *(void **)(a1 + 32));
  NSUInteger v5 = v4;
  NSUInteger v6 = [*(id *)(*(void *)(a1 + 40) + 16) count];
  v12.location = v3;
  v12.length = v5;
  v13.location = 0;
  v13.length = v6;
  NSRange v8 = NSIntersectionRange(v12, v13);
  NSUInteger result = v8.location;
  if (v8.length) {
    NSUInteger result = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "replaceObjectsInRange:withObject:length:", v8.location, v8.length, *(void *)(a1 + 48), v8.length);
  }
  if (v3 + v5 > v6)
  {
    if (v3 <= v6)
    {
      NSUInteger v5 = v3 + v5 - v6;
    }
    else
    {
      objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "insertObject:range:", 0, v6, v3 - v6);
      NSUInteger v6 = v3;
    }
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void **)(*(void *)(a1 + 40) + 16);
    return objc_msgSend(v10, "insertObject:range:", v9, v6, v5);
  }
  return result;
}

uint64_t __33___NSTextRunStorage_contentRange__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  if (result)
  {
    unint64_t v5 = result;
    unint64_t v6 = 0;
    unint64_t v12 = 0;
    uint64_t v13 = 0;
    while (1)
    {
      uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) objectAtIndex:v6 effectiveRange:&v12];
      if (result)
      {
        uint64_t v7 = result;
        uint64_t result = [MEMORY[0x1E4F1CA98] null];
        if (v7 != result) {
          break;
        }
      }
      unint64_t v6 = v13 + v12;
      if (v13 + v12 >= v5) {
        return result;
      }
    }
    uint64_t v8 = v13;
    if (v13)
    {
      uint64_t v9 = v12;
      unint64_t v10 = v13 + v12;
      if (v13 + v12 < v5)
      {
        unint64_t v12 = v5;
        uint64_t v13 = 0;
        while (1)
        {
          uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 16) objectAtIndex:v5 - 1 effectiveRange:&v12];
          if (v11)
          {
            if (v11 != [MEMORY[0x1E4F1CA98] null]) {
              break;
            }
          }
          unint64_t v5 = v12;
          if (v10 >= v12) {
            goto LABEL_15;
          }
        }
        uint64_t v8 = v12 - v9 + v13;
      }
LABEL_15:
      uint64_t result = [(_NSTextRunStorage *)a2 _createTextRangeFromRange:v8];
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
    }
  }
  return result;
}

uint64_t __32___NSTextRunStorage_description__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@ => %@,\n", objc_msgSend(a3, "description"), a2];
}

id __33___NSTextRunStorage_contentRange__block_invoke(uint64_t a1, id *a2)
{
  id result = *a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

void __33___NSTextRunStorage_contentRange__block_invoke_2(uint64_t a1, id *a2)
{
  if (*a2)
  {
    NSUInteger v3 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) location], objc_msgSend(*a2, "endLocation"));

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = v3;
  }
}

id __69___NSTextRunStorage_enumerateObjectsFromLocation_options_usingBlock___block_invoke(uint64_t a1, id *a2)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  id result = (id)[*a2 endLocation];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __53___NSTextRunStorage_invalidateElementsInRange_delta___block_invoke(uint64_t a1, id *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *a2;
  if (*(unsigned char *)(v4 + 56))
  {
    uint64_t v6 = [v5 range];
    uint64_t v8 = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", *(void *)(a1 + 40) + v6, v7);
  }
  else
  {
    uint64_t v9 = -[_NSTextRunStorage _locationFromLocation:withOffset:]((NSCountableTextLocation *)v4, (void *)[v5 location], *(void *)(a1 + 40));
    uint64_t v8 = -[NSCountableTextRange initWithLocation:endLocation:]([NSCountableTextRange alloc], "initWithLocation:endLocation:", v9, -[_NSTextRunStorage _locationFromLocation:withOffset:](*(NSCountableTextLocation **)(a1 + 32), (void *)[*a2 endLocation], *(void *)(a1 + 40)));
  }
  unint64_t v10 = v8;

  *a2 = v10;
}

@end