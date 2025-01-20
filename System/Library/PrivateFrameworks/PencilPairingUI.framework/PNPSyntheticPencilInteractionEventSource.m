@interface PNPSyntheticPencilInteractionEventSource
- (BOOL)isPlaying;
- (NSArray)playlist;
- (PNPPencilInteractionEventDestination)eventDestination;
- (id)_terminalEventsForPlayhead;
- (int64_t)_playlistPositionForPosition:(int64_t)a3;
- (void)_playEventAtPlayheadPosition:(int64_t)a3;
- (void)play;
- (void)setEventDestination:(id)a3;
- (void)stop;
@end

@implementation PNPSyntheticPencilInteractionEventSource

- (BOOL)isPlaying
{
  return self->_playing && !self->_cancelled;
}

- (void)play
{
  self->_cancelled = 0;
  if (!self->_playing)
  {
    self->_playing = 1;
    [(PNPSyntheticPencilInteractionEventSource *)self _playEventAtPlayheadPosition:0];
  }
}

- (void)_playEventAtPlayheadPosition:(int64_t)a3
{
  v5 = [(PNPSyntheticPencilInteractionEventSource *)self playlist];
  v6 = [v5 objectAtIndex:a3];

  v7 = [(PNPSyntheticPencilInteractionEventSource *)self eventDestination];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__PNPSyntheticPencilInteractionEventSource__playEventAtPlayheadPosition___block_invoke;
  v8[3] = &unk_264DA5790;
  v8[4] = self;
  v8[5] = a3;
  [v6 serviceDestination:v7 fromSource:self withCompletionBlock:v8];
}

uint64_t __73__PNPSyntheticPencilInteractionEventSource__playEventAtPlayheadPosition___block_invoke(uint64_t result)
{
  v1 = *(unsigned char **)(result + 32);
  if (v1[9])
  {
    v1[8] = 0;
    *(unsigned char *)(*(void *)(result + 32) + 9) = 0;
  }
  else
  {
    uint64_t v2 = [*(id *)(result + 32) _playlistPositionForPosition:*(void *)(result + 40) + 1];
    return [v1 _playEventAtPlayheadPosition:v2];
  }
  return result;
}

- (id)_terminalEventsForPlayhead
{
  return (id)MEMORY[0x263EFFA68];
}

- (void)stop
{
  self->_cancelled = 1;
}

- (NSArray)playlist
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

- (int64_t)_playlistPositionForPosition:(int64_t)a3
{
  v4 = [(PNPSyntheticPencilInteractionEventSource *)self playlist];
  unint64_t v5 = [v4 count] - 1;

  if (v5 >= a3) {
    return a3;
  }
  else {
    return 0;
  }
}

- (PNPPencilInteractionEventDestination)eventDestination
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->eventDestination);
  return (PNPPencilInteractionEventDestination *)WeakRetained;
}

- (void)setEventDestination:(id)a3
{
}

- (void).cxx_destruct
{
}

@end