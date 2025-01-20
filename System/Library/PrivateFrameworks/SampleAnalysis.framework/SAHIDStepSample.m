@interface SAHIDStepSample
- (id)debugDescription;
@end

@implementation SAHIDStepSample

- (id)debugDescription
{
  id v3 = [NSString alloc];
  v4 = [(SATask *)self->_task debugDescription];
  unint64_t startSampleIndex = self->_startSampleIndex;
  unint64_t endSampleIndex = self->_endSampleIndex;
  unint64_t threadId = self->_threadId;
  v8 = [(SATimestamp *)self->_startTimestamp debugDescription];
  v9 = [(SATimestamp *)self->_endTimestamp debugDescription];
  v10 = (void *)[v3 initWithFormat:@"hid step sample %@ thread 0x%llx, %lu-%lu, %@-%@", v4, threadId, startSampleIndex, endSampleIndex, v8, v9];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTimestamp, 0);
  objc_storeStrong((id *)&self->_startTimestamp, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

@end